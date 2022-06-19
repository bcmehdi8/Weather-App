import 'dart:convert';

class WeatherWind {
  final double speed;
  final int deg;

  WeatherWind({
    required this.speed,
    required this.deg,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
    };
  }

  factory WeatherWind.fromMap(Map<String, dynamic> map) {
    return WeatherWind(
      speed: map['speed'] as double,
      deg: map['deg'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherWind.fromJson(String source) => WeatherWind.fromMap(json.decode(source) as Map<String, dynamic>);
}
