import 'package:flutter/material.dart';
import '../model/weather_response.dart';
import '../widgets/card_widget.dart';
import '../widgets/data_container_widget.dart';
import '../themes/app_space_constants.dart';
import '../themes/app_strings.dart';
import '../themes/textstyles.dart';

import '../widgets/data_card_widget.dart';
import '../widgets/horizontal_data_card_row_widget.dart';
import '../widgets/title_widget.dart';

class CityWeatherWidget extends StatelessWidget {
  final WeatherResponse data;
  const CityWeatherWidget({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    var degreeSymbol = AppString.degreeSymbol;
    var widthOfScreen = MediaQuery.of(context).size.width - 66;
    var oneWidthForThree = widthOfScreen / 3;
    var oneWidthForTwo = widthOfScreen / 2;
    return Column(
      children: [
        TemperatureMainWidget(
          data: data.main,
          degreeSymbol: degreeSymbol,
          oneWidthForThree: oneWidthForThree,
          oneWidthForTwo: oneWidthForTwo,
        ),
        VisibilityMainWidget(
            degreeSymbol: degreeSymbol,
            visibility: (data.visibility) ?? 0,
            oneWidthForTwo: oneWidthForTwo),
        WindMainWidget(
          oneWidthForTwo: oneWidthForTwo,
          data: data.wind,
          degreeSymbol: degreeSymbol,
          oneWidthForThree: oneWidthForThree,
        ),
        RainMainWidget(
          data: data.rain,
          oneWidthForTwo: oneWidthForTwo,
        ),
        // SnowMainWidget(
        //   oneWidthForTwo: oneWidthForTwo,
        // ),
      ],
    );
  }
}

class SnowMainWidget extends StatelessWidget {
  const SnowMainWidget({
    super.key,
    required this.oneWidthForTwo,
  });

  final double oneWidthForTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const TitleWidget(title: AppString.textSnow),
        AppSpaceConstants.kGapH15,
        Column(
          children: [
            const DataSeparationWidget(),
            HorizontalDataCardRowWidget(children: [
              DataCardWidget(
                oneWidth: oneWidthForTwo,
                title: AppString.textSnowIn1H,
                subTitle: "55",
              ),
              DataCardWidget(
                oneWidth: oneWidthForTwo,
                title: AppString.textSnowIn2H,
                subTitle: "55",
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

class WindMainWidget extends StatelessWidget {
  const WindMainWidget({
    super.key,
    required this.degreeSymbol,
    required this.oneWidthForThree,
    required this.oneWidthForTwo,
    this.data,
  });

  final String degreeSymbol;
  final double oneWidthForThree;
  final double oneWidthForTwo;
  final Wind? data;

  @override
  Widget build(BuildContext context) {
    var width = data?.gust == null ? oneWidthForTwo : oneWidthForThree;
    return data == null
        ? Container()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TitleWidget(title: AppString.textWind),
              AppSpaceConstants.kGapH15,
              Column(
                children: [
                  const DataSeparationWidget(),
                  HorizontalDataCardRowWidget(children: [
                    DataCardWidget(
                      oneWidth: width,
                      title: AppString.textSpeed,
                      subTitle: "${data?.speed.toString()}",
                    ),
                    DataCardWidget(
                      oneWidth: width,
                      title: AppString.textDegree,
                      subTitle: "${data?.deg.toString()}",
                    ),
                    DataCardWidget(
                      oneWidth: width,
                      title: AppString.textGust,
                      subTitle: "${data?.gust.toString()}",
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

class TemperatureMainWidget extends StatelessWidget {
  TemperatureMainWidget({
    super.key,
    required this.degreeSymbol,
    required this.oneWidthForThree,
    required this.oneWidthForTwo,
    required this.data,
  });

  final String degreeSymbol;
  final double oneWidthForThree;
  final double oneWidthForTwo;
  Main? data;

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
                      oneWidth: oneWidthForThree,
                      title: AppString.textFeelsLike,
                      subTitle:
                          "${data?.feelsLike.toString()}${AppString.degreeSymbol}",
                    ),
                    DataCardWidget(
                      oneWidth: oneWidthForThree,
                      title: AppString.textHumidity,
                      subTitle: data?.humidity.toString() ?? "",
                    ),
                    DataCardWidget(
                      oneWidth: oneWidthForThree,
                      title: AppString.textPressure,
                      subTitle: data?.pressure.toString() ?? "",
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
