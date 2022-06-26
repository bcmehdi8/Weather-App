import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather/core/utils/app_assets.dart';
import 'package:weather/core/utils/app_colors.dart';
import 'package:weather/modules/weather_home/controller/weather_home_controller.dart';
import 'package:weather/modules/weather_home/model/location_weather_model.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: AppColors.TBlue3.withOpacity(0.4),
              offset: const Offset(0, 4),
              blurRadius: 40,
              spreadRadius: 0,
            ),
          ],
        ),
        child: SizedBox(
          //  height: 200,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                colors: [
                  AppColors.TBlue1,
                  AppColors.TBlue2,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  _BuildDateTime(),
                  _BuildWeatherInfo(),
                  _BuildUpdateWeather(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _BuildDateTime extends ConsumerWidget {
  const _BuildDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LocationWeather? cityWeatherProvider = ref.watch(weatherCityProvider);
    return Row(
      children: [
        Text(
          'Sunday, 20 July 2022',
          style: Theme.of(context).textTheme.subtitle2!,
        ),
        const Spacer(),
        Text(
          Jiffy(cityWeatherProvider?.weather.time).jm,
          style: Theme.of(context).textTheme.subtitle2!,
        ),
      ],
    );
  }
}

class _BuildWeatherInfo extends ConsumerWidget {
  const _BuildWeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final LocationWeather? cityWeatherProvider = ref.watch(weatherCityProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: DecoratedBox(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          spreadRadius: 0,
                          blurRadius: 8)
                    ]),
                    child: SvgPicture.asset(AppAssets.partlyCloudyDay)),
              ),
              const SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${cityWeatherProvider?.weather.temperature.actualTemp}º C',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${cityWeatherProvider?.weather.summary.title}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _BuildUpdateWeather extends StatelessWidget {
  const _BuildUpdateWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Last update 3.00 PM',
      style: Theme.of(context).textTheme.subtitle2!,
    );
  }
}
