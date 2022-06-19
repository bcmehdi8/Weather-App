// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'weather_cloud.dart';
import 'weather_summary.dart';
import 'weather_temperature.dart';
import 'weather_wind.dart';

class Weather {
  final WeatherSummary summary;
  final WeatherTemperature temperature;
  final WeatherWind wind;
  final WeatherCloud cloud;
  final DateTime time;
  
  Weather({
    required this.summary,
    required this.temperature,
    required this.wind,
    required this.cloud,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'summary': summary.toMap(),
      'temperature': temperature.toMap(),
      'wind': wind.toMap(),
      'cloud': cloud.toMap(),
      'time': time.millisecondsSinceEpoch,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      summary: WeatherSummary.fromMap(map['summary'] as Map<String,dynamic>),
      temperature: WeatherTemperature.fromMap(map['temperature'] as Map<String,dynamic>),
      wind: WeatherWind.fromMap(map['wind'] as Map<String,dynamic>),
      cloud: WeatherCloud.fromMap(map['clouds'] as Map<String,dynamic>),
      time: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source) as Map<String, dynamic>);
}
