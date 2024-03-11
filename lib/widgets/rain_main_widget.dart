import 'package:flutter/material.dart';

import '../model/weather_response.dart';
import '../themes/app_space_constants.dart';
import '../themes/app_strings.dart';
import 'data_card_widget.dart';
import 'data_container_widget.dart';
import 'horizontal_data_card_row_widget.dart';
import 'title_widget.dart';

class RainMainWidget extends StatelessWidget {
  const RainMainWidget({
    super.key,
    required this.oneWidthForTwo,
    this.data,
  });

  final double oneWidthForTwo;
  final Rain? data;

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TitleWidget(title: AppString.textRain),
              AppSpaceConstants.kGapH15,
              Column(
                children: [
                  const DataSeparationWidget(),
                  HorizontalDataCardRowWidget(children: [
                    DataCardWidget(
                      oneWidth: oneWidthForTwo,
                      title: AppString.textRainIn1H,
                      subTitle: "${data?.the1H.toString()}",
                    ),
                    DataCardWidget(
                      oneWidth: oneWidthForTwo,
                      title: AppString.textRainIn2H,
                      subTitle: "${data?.the1H.toString()}",
                    ),
                  ]),
                  const DataSeparationWidget(),
                ],
              ),
              AppSpaceConstants.kGapH80,
            ],
          );
  }
}
