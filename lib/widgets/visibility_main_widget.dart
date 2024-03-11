import 'package:flutter/material.dart';
import 'package:one_weather/themes/asset_strings.dart';

import '../themes/app_space_constants.dart';
import '../themes/app_strings.dart';
import '../themes/textstyles.dart';
import 'card_widget.dart';
import 'data_card_widget.dart';
import 'data_container_widget.dart';
import 'title_widget.dart';

class VisibilityMainWidget extends StatelessWidget {
  const VisibilityMainWidget({
    super.key,
    required this.visibility,
    required this.degreeSymbol,
    required this.oneWidthForTwo,
  });

  final String degreeSymbol;
  final double oneWidthForTwo;
  final int? visibility;

  @override
  Widget build(BuildContext context) {
    return visibility == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TitleWidget(title: AppString.textVisibility),
              AppSpaceConstants.kGapH15,
              Column(
                children: [
                  const DataSeparationWidget(),
                  AppSpaceConstants.kGapH10,
                  Opacity(
                    opacity: (visibility! / 10000),
                    child: const Center(
                      child: CardWidget(
                        child: Text(AppString.textHowVisibleIsThisText,
                            style: AppTextStyle.kFs25),
                      ),
                    ),
                  ),
                  AppSpaceConstants.kGapH10,
                  DataCardWidget(
                    icon: AssetIcons.visibility,
                    oneWidth: oneWidthForTwo,
                    title: AppString.textVisibility,
                    subTitle: "${visibility! / 1000} km",
                  ),
                  AppSpaceConstants.kGapH10,
                  const DataSeparationWidget(),
                ],
              ),
              AppSpaceConstants.kGapH80,
            ],
          );
  }
}
