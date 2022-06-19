import 'package:weather/core/services/graphql_provider.dart';
import 'package:weather/modules/weather_home/model/location_weather_model.dart';

class WeatherAPI extends GraphQLService {
  Future<LocationWeather?> findCityWeather(String name) async {
    return null;
  }
}
