import 'package:flutter/material.dart';
import 'package:one_weather/themes/app_space_constants.dart';

import '../themes/app_colors.dart';
import '../themes/textstyles.dart';
import 'card_widget.dart';

class DataCardWidget extends StatelessWidget {
  const DataCardWidget({
    this.title,
    this.subTitle,
    this.icon,
    super.key,
    required this.oneWidth,
  });
  final String? title;
  final String? subTitle;
  final String? icon;
  final double oneWidth;

  @override
  Widget build(BuildContext context) {
    return (title == null || subTitle == null || subTitle == "null")
        ? Container()
        : CardWidget(
            width: oneWidth,
            child: Column(
              children: [
                AppSpaceConstants.kGapH5,
                Text(
                  title ?? "",
                  style: AppTextStyle.cardTextSyle,
                  textAlign: TextAlign.center,
                ),
                AppSpaceConstants.kGapH10,
                Text(
                  subTitle ?? "",
                  style: AppTextStyle.cardTextDataStyle,
                  textAlign: TextAlign.center,
                ),
                AppSpaceConstants.kGapH10,
                Icon(
                  Icons.temple_hindu_sharp,
                  color: AppColors.iconColor,
                  size: 28,
                ),
                AppSpaceConstants.kGapH5,
              ],
            ),
          );
  }
}
