import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherTemperature {
  final int actualTemp;
  final double feelsLike;
  final double minTemp;
  final double maxTemp;

  WeatherTemperature({
    required this.actualTemp,
    required this.feelsLike,
    required this.minTemp,
    required this.maxTemp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'actualTemp': actualTemp,
      'feelsLike': feelsLike,
      'minTemp': minTemp,
      'maxTemp': maxTemp,
    };
  }

  factory WeatherTemperature.fromMap(Map<String, dynamic> map) {
    return WeatherTemperature(
      actualTemp: map['actual'].toInt(),
      feelsLike: map['feelsLike'] as double,
      minTemp: map['min'] as double,
      maxTemp: map['max'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherTemperature.fromJson(String source) =>
      WeatherTemperature.fromMap(json.decode(source) as Map<String, dynamic>);
}
