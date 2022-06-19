import 'package:flutter/material.dart';
import 'package:weather/core/utils/app_constants.dart';
import 'widgets/daily_weather.dart';
import 'widgets/home_app_bar.dart';
import 'widgets/hourly_weather_widget.dart';
import 'widgets/weather_card.dart';

class WeatherHomeView extends StatelessWidget {
  const WeatherHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                HomeAppbar(),
                WeatherCard(),
                HourlyWeather(),
                DailyWeather(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
