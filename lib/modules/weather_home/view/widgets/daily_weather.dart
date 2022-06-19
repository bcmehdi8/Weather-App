import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/core/utils/app_assets.dart';
import 'package:weather/core/utils/app_colors.dart';
import 'package:weather/core/utils/app_strings.dart';

class DailyWeather extends StatelessWidget {
  const DailyWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.daily,
            style: Theme.of(context).textTheme.headline1!,
          ),
          const SizedBox(height: 10),
          const _BuildTomorrowWeather(),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            shrinkWrap: true,
            itemBuilder: (context, index) => const Align(
              heightFactor: 1.1,
              child: _BuildDailyWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class _BuildDailyWidget extends StatelessWidget {
  const _BuildDailyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.TBlue4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(vertical: 16, horizontal: size.width * .05),
        child: Row(
          children: [
            DecoratedBox(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.TBlue5),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: SvgPicture.asset(AppAssets.heavyShowers),
                ),
              ),
            ),
            SizedBox(width: size.width * .05),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Monday',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(height: 2),
                Text(
                  'Thunderstorm',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
            const Spacer(),
            Text(
              '19ºC',
              style: Theme.of(context).textTheme.bodyText1!,
            ),
            SizedBox(width: size.width * .03),
            Icon(
              EvaIcons.arrowRight,
              size: 16,
              color: Theme.of(context).textTheme.bodyText1!.color,
            )
          ],
        ),
      ),
    );
  }
}

class _BuildTomorrowWeather extends StatelessWidget {
  const _BuildTomorrowWeather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.TRed.withOpacity(0.13),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: 16, horizontal: size.width * .05),
          child: Row(
            children: [
              SizedBox(
                height: 45,
                width: 45,
                child: SvgPicture.asset(
                  AppAssets.heavyShowers,
                  color: AppColors.TRed1,
                ),
              ),
              SizedBox(width: size.width * .05),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.only(end: size.width * .06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tomorrow's weather is likely it will rain in the afternoon",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Don't forget to bring an umbrella",
                        textAlign: TextAlign.start,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
