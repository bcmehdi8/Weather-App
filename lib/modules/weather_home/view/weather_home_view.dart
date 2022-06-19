import 'package:flutter/material.dart';
import 'package:weather/core/utils/app_constants.dart';
import 'package:weather/modules/weather_home/view/widgets/home_app_bar.dart';
import 'package:weather/modules/weather_home/view/widgets/weather_card.dart';

import 'widgets/hourly_weather_widget.dart';

class WeatherHomeView extends StatelessWidget {
  const WeatherHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HomeAppbar(),
              WeatherCard(),
              HourlyWeather(),
            ],
          ),
        ),
      ),
    );
  }
}
