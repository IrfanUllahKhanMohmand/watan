import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../data/site_repository.dart';
import '../../domain/entities/site.dart';
import '../widgets/site_sheet.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    this.repository = const SiteRepository(),
  });

  final SiteRepository repository;

  static const _peshawar = LatLng(34.0151, 71.5249);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Watan')),
      body: FutureBuilder<List<Site>>(
        future: repository.loadAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Places could not be opened.'));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final sites = snapshot.data!;
          return FlutterMap(
            options: const MapOptions(
              initialCenter: _peshawar,
              initialZoom: 12.4,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.watan.watan',
              ),
              MarkerLayer(
                markers: [
                  for (final site in sites)
                    Marker(
                      point: LatLng(site.latitude, site.longitude),
                      width: 40,
                      height: 40,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: Icon(
                          Icons.place,
                          color: Theme.of(context).colorScheme.primary,
                          size: 36,
                        ),
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            showDragHandle: true,
                            builder: (context) => SiteSheet(site: site),
                          );
                        },
                      ),
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
