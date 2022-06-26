import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/modules/weather_home/controller/api_service/weather_api.dart';
import 'package:weather/modules/weather_home/controller/repository/weather_repository.dart';
import 'package:weather/modules/weather_home/model/location_weather_model.dart';

final weatherCityProvider =
    StateNotifierProvider<WeatherHomeController, LocationWeather?>(
        (ref) => WeatherHomeController());

class WeatherHomeController extends StateNotifier<LocationWeather?>
    implements WeatherRepository {
  WeatherHomeController() : super(null);

  final WeatherAPI _weatherAPI = WeatherAPI();

  @override
  Future<LocationWeather?> findCityWeatherAPI(String cityName) async {
    try {
      final response = await _weatherAPI.findCityWeather(cityName);
      state = response;
      return response;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  @override
  Future<LocationWeather> findSavedCityWeather() {
    throw UnimplementedError();
  }
}
