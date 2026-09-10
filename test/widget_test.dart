import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watan/domain/entities/site.dart';
import 'package:watan/main.dart';
import 'package:watan/presentation/widgets/site_sheet.dart';

void main() {
  test('parses a map site', () {
    final site = Site.fromJson({
      'id': 'bala-hisar',
      'title': 'Bala Hisar Fort',
      'latitude': 34.0126,
      'longitude': 71.5734,
      'explainer': 'A fort above the city.',
    });
    expect(site.title, 'Bala Hisar Fort');
  });

  testWidgets('shows the Peshawar map', (tester) async {
    await tester.pumpWidget(const WatanApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.text('Watan'), findsOneWidget);
    expect(find.byType(FlutterMap), findsOneWidget);
  });

  testWidgets('explainer sheet shows the story', (tester) async {
    const site = Site(
      id: 'qissa-khwani',
      title: 'Qissa Khwani Bazaar',
      latitude: 34.01,
      longitude: 71.57,
      explainer: 'The street of storytellers.',
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SiteSheet(site: site)),
      ),
    );

    expect(find.text('Qissa Khwani Bazaar'), findsOneWidget);
    expect(find.text('The street of storytellers.'), findsOneWidget);
  });
}
