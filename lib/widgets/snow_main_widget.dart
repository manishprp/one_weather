import 'package:flutter/material.dart';

import '../themes/app_space_constants.dart';
import '../themes/app_strings.dart';
import 'data_card_widget.dart';
import 'data_container_widget.dart';
import 'horizontal_data_card_row_widget.dart';
import 'title_widget.dart';

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
