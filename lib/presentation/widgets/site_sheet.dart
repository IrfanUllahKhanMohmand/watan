import 'package:flutter/material.dart';

import '../../domain/entities/site.dart';

class SiteSheet extends StatelessWidget {
  const SiteSheet({super.key, required this.site});

  final Site site;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(site.title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text(site.explainer),
        ],
      ),
    );
  }
}
