import 'package:flutter/material.dart';
import 'package:one_weather/themes/asset_strings.dart';

import '../model/weather_response.dart';
import '../themes/app_space_constants.dart';
import '../themes/app_strings.dart';
import '../themes/textstyles.dart';
import 'data_card_widget.dart';
import 'data_container_widget.dart';
import 'horizontal_data_card_row_widget.dart';
import 'title_widget.dart';

class TemperatureMainWidget extends StatelessWidget {
  const TemperatureMainWidget({
    super.key,
    required this.degreeSymbol,
    required this.oneWidthForThree,
    required this.oneWidthForTwo,
    required this.data,
  });

  final String degreeSymbol;
  final double oneWidthForThree;
  final double oneWidthForTwo;
  final Main? data;

  @override
  Widget build(BuildContext context) {
    return data == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TitleWidget(title: AppString.textTemperature),
              AppSpaceConstants.kGapH15,
              Column(
                children: [
                  const DataSeparationWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${data?.temp ?? ""}${AppString.degreeSymbol}",
                        style: AppTextStyle.largeTextStyle,
                      ),
                    ],
                  ),
                  HorizontalDataCardRowWidget(children: [
                    DataCardWidget(
                      icon: AssetIcons.temperature,
                      oneWidth: oneWidthForThree,
                      title: AppString.textFeelsLike,
                      subTitle:
                          "${data?.feelsLike.toString()}${AppString.degreeSymbol}",
                    ),
                    DataCardWidget(
                      icon: AssetIcons.humidity,
                      oneWidth: oneWidthForThree,
                      title: AppString.textHumidity,
                      subTitle: "${data?.humidity} %",
                    ),
                    DataCardWidget(
                      icon: AssetIcons.pressure,
                      oneWidth: oneWidthForThree,
                      title: AppString.textPressure,
                      subTitle: "${data?.pressure} hPa",
                    ),
                  ]),
                  HorizontalDataCardRowWidget(children: [
                    DataCardWidget(
                      oneWidth: oneWidthForTwo,
                      title: AppString.textTempMin,
                      subTitle:
                          "${data?.tempMin.toString()}${AppString.degreeSymbol}",
                    ),
                    DataCardWidget(
                      oneWidth: oneWidthForTwo,
                      title: AppString.textTempMax,
                      subTitle:
                          "${data?.tempMax.toString()}${AppString.degreeSymbol}",
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
