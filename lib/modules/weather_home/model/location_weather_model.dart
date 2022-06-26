// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:weather/modules/weather_home/model/cordinate_model.dart';
import 'package:weather/modules/weather_home/model/weather_model.dart';

class LocationWeather {
  final String id;
  final String city;
  final String country;
  final Coordinates coordinates;
  final Weather weather;

  LocationWeather({
    required this.id,
    required this.city,
    required this.country,
    required this.coordinates,
    required this.weather,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'city': city,
      'country': country,
      'coordinates': coordinates.toMap(),
      'weather': weather.toMap(),
    };
  }

  factory LocationWeather.fromMap(Map<String, dynamic> map) {
    return LocationWeather(
      id: map['id'] as String,
      city: map['name'] as String,
      country: map['country'] as String,
      coordinates: Coordinates.fromMap(map['coord'] as Map<String, dynamic>),
      weather: Weather.fromMap(map['weather'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory LocationWeather.fromJson(String source) =>
      LocationWeather.fromMap(json.decode(source) as Map<String, dynamic>);
}
