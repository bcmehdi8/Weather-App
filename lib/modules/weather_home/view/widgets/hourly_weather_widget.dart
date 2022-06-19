import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weather/core/utils/app_assets.dart';
import 'package:weather/core/utils/app_strings.dart';

class HourlyWeather extends StatelessWidget {
  const HourlyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.lastUpdate,
            style: Theme.of(context).textTheme.headline1!,
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 50.0, maxHeight: 130),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) => Align(
                widthFactor: 1.1,
                alignment: Alignment.centerLeft,
                child: _BuildHourlyWidget(
                  iconPath: AppAssets.clearDay,
                  degree: 20,
                  time: DateTime.now(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildHourlyWidget extends StatelessWidget {
  const _BuildHourlyWidget({
    Key? key,
    required this.iconPath,
    required this.degree,
    required this.time,
  }) : super(key: key);

  final String iconPath;
  final int degree;
  final DateTime time;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 17),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: SvgPicture.asset(iconPath),
            ),
            const SizedBox(height: 5),
            Text(
              "$degreeº",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 9),
            Text(
              Jiffy(time).jm,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
