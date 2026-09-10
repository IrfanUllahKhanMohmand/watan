import 'dart:convert';

import 'package:flutter/services.dart';

import '../domain/entities/site.dart';

class SiteRepository {
  const SiteRepository();

  Future<List<Site>> loadAll() async {
    final raw = await rootBundle.loadString('assets/data/sites.json');
    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map((item) => Site.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
