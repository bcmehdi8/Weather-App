import 'package:weather/modules/weather_home/model/location_weather_model.dart';

abstract class WeatherRepository {
  Future<LocationWeather> findCityWeatherAPI(String cityName);
  Future<LocationWeather> findSavedCityWeather();
}
