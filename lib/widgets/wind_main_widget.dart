import 'package:flutter/material.dart';

import '../model/weather_response.dart';
import '../themes/app_space_constants.dart';
import '../themes/app_strings.dart';
import '../themes/asset_strings.dart';
import 'data_card_widget.dart';
import 'data_container_widget.dart';
import 'horizontal_data_card_row_widget.dart';
import 'title_widget.dart';

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
                      icon: AssetIcons.wind,
                      oneWidth: width,
                      title: AppString.textSpeed,
                      subTitle: "${data?.speed} m/s",
                    ),
                    DataCardWidget(
                      icon: AssetIcons.wind,
                      oneWidth: width,
                      title: AppString.textDegree,
                      subTitle: "${data?.deg}\u00B0",
                    ),
                    data?.gust == 0
                        ? DataCardWidget(
                            icon: AssetIcons.wind,
                            oneWidth: width,
                            title: AppString.textGust,
                            subTitle: "${data?.gust} m/s",
                          )
                        : Container(),
                  ]),
                  const DataSeparationWidget(),
                ],
              ),
              AppSpaceConstants.kGapH80,
            ],
          );
  }
}
