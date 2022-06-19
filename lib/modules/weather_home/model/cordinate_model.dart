import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Coordinates {
  final double longitude;
  final double latitude;

  Coordinates({
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory Coordinates.fromMap(Map<String, dynamic> map) {
    return Coordinates(
      longitude: map['lon'] as double,
      latitude: map['lat'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coordinates.fromJson(String source) =>
      Coordinates.fromMap(json.decode(source) as Map<String, dynamic>);
}
