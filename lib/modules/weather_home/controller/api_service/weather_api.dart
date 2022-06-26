import 'package:graphql/client.dart';
import 'package:weather/core/services/graphql_provider.dart';
import 'package:weather/modules/weather_home/model/location_weather_model.dart';

class WeatherAPI extends GraphQLService {
  Future<LocationWeather?> findCityWeather(String name) async {
    const String weatherQuery = r'''
          query ($name:String!) {
            getCityByName(name: $name, config:{units:metric,lang:en}) {
              id
              name
              country
              coord {
                lon
                lat
              }
            weather {
              summary {
                title
                description
                icon
              }
              temperature {
                actual
                feelsLike
                min
                max
              }
              wind {
                speed
                deg
              }
              clouds {
                all
                visibility
                humidity
              }
              timestamp
            }
          }
        }
    ''';

    final result = await queryVariables(
      WatchQueryOptions(document: gql(weatherQuery), variables: {
        'name': name,
      }),
    );

    if (result.hasException) {
      handleException(result);
      return null;
    }

    final Map<String, dynamic>? data = result.data;
    dynamic json = data!['getCityByName'];
    LocationWeather cityWeather = LocationWeather.fromMap(json);

    return cityWeather;
  }
}
