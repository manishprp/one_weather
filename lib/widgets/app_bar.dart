import 'package:flutter/material.dart';
import 'package:one_weather/model/location_model.dart';
import 'package:one_weather/screens/search_screen.dart';

import '../themes/app_colors.dart';
import '../themes/textstyles.dart';
import 'dot_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.dotCount});
  final List<LocationModel> dotCount;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      clipBehavior: Clip.antiAlias,
      expandedHeight: 56.5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.kFcWhite,
              ),
              IndicatorWidget(dotCount: dotCount, title: title),
            ]),
        centerTitle: true,
      ),
      backgroundColor: AppColors.primaryColor,
      iconTheme: const IconThemeData(
        color: AppColors.textColor,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchScreen()),
            );
          },
          icon: const Icon(Icons.list_alt),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.dotCount,
    required this.title,
  });

  final List<LocationModel> dotCount;
  final String title;

  @override
  Widget build(BuildContext context) {
    var count = dotCount
        .where(
          (element) => element != dotCount[0],
        )
        .toList();
    return Row(
      children: [
        Icon(
          size: 14,
          Icons.location_pin,
          color: dotCount[0].cityName == title
              ? AppColors.textColor
              : AppColors.subTextColor,
        ),
        ...count
            .map(
              (e) => DotWidget(
                size: 8,
                spacing: 5,
                color: title == e.cityName
                    ? AppColors.textColor
                    : AppColors.subTextColor,
              ),
            )
            .toList()
      ],
    );
  }
}
