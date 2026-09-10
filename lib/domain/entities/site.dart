class Site {
  const Site({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.explainer,
  });

  final String id;
  final String title;
  final double latitude;
  final double longitude;
  final String explainer;

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      id: json['id'] as String,
      title: json['title'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      explainer: json['explainer'] as String,
    );
  }
}
