import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherSummary {
  final String title;
  final String description;
  final String icon;
  
  WeatherSummary({
    required this.title,
    required this.description,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'icon': icon,
    };
  }

  factory WeatherSummary.fromMap(Map<String, dynamic> map) {
    return WeatherSummary(
      title: map['title'] as String,
      description: map['description'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherSummary.fromJson(String source) => WeatherSummary.fromMap(json.decode(source) as Map<String, dynamic>);
}
