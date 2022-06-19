import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherCloud {
  final int all;
  final int visibility;
  final int humidity;
  
  WeatherCloud({
    required this.all,
    required this.visibility,
    required this.humidity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
      'visibility': visibility,
      'humidity': humidity,
    };
  }

  factory WeatherCloud.fromMap(Map<String, dynamic> map) {
    return WeatherCloud(
      all: map['all'] as int,
      visibility: map['visibility'] as int,
      humidity: map['humidity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherCloud.fromJson(String source) => WeatherCloud.fromMap(json.decode(source) as Map<String, dynamic>);
}
