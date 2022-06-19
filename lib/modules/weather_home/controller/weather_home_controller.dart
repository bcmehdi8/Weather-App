import 'package:flutter/material.dart';
import 'package:weather/modules/weather_home/controller/repository/weather_repository.dart';
import 'package:weather/modules/weather_home/model/location_weather_model.dart';

class WeatherHomeController extends ChangeNotifier
    implements WeatherRepository {
  @override
  Future<LocationWeather> findCityWeatherAPI(String cityName) {
    
    throw UnimplementedError();
  }

  @override
  Future<LocationWeather> findSavedCityWeather() {
    throw UnimplementedError();
  }
}
