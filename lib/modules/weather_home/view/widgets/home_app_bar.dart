import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/core/utils/app_assets.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SvgPicture.asset(
            AppAssets.location,
            color: Theme.of(context).iconTheme.color,
          ),
          const SizedBox(width: 6),
          Text(
            'Casablanca, Morocco',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const Spacer(),
          SvgPicture.asset(
            AppAssets.search,
            color: Theme.of(context).iconTheme.color,
          ),
        ],
      ),
    );
  }
}
