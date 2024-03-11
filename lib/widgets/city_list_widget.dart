import 'package:flutter/material.dart';
import '../utils/string_format.dart';

import '../themes/textstyles.dart';

// ignore: must_be_immutable
class CityListItemWidget extends StatelessWidget {
  CityListItemWidget(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.city,
      this.visible = false,
      this.allVisible = false,
      this.onCheckbxToggled});
  final double latitude;
  final double longitude;
  final String city;
  bool visible;
  void Function(bool?)? onCheckbxToggled;
  bool allVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "City : $city",
          style: AppTextStyle.kFs25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Latitude : ${StringFormat.roundToTwo(
                latitude.toString(),
              )}",
              style: AppTextStyle.kFs25,
            ),
            allVisible
                ? Checkbox(
                    value: visible,
                    onChanged: onCheckbxToggled,
                  )
                : Container()
          ],
        ),
        Text(
          "Longitude : ${StringFormat.roundToTwo(
            longitude.toString(),
          )}",
          style: AppTextStyle.kFs25,
        ),
      ],
    );
  }
}
