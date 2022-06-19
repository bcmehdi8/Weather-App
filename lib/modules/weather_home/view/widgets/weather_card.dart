import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/core/utils/app_assets.dart';
import 'package:weather/core/utils/app_colors.dart';

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

class _BuildDateTime extends StatelessWidget {
  const _BuildDateTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Sunday, 20 July 2022',
          style: Theme.of(context).textTheme.subtitle2!,
        ),
        const Spacer(),
        Text(
          '4:10 PM',
          style: Theme.of(context).textTheme.subtitle2!,
        ),
      ],
    );
  }
}

class _BuildWeatherInfo extends StatelessWidget {
  const _BuildWeatherInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    '18º C',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w400, fontSize: 20),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Cloudy Rain',
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
