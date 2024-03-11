import 'package:flutter/material.dart';
import '../model/weather_response.dart';
import '../themes/app_strings.dart';
import '../widgets/rain_main_widget.dart';
import '../widgets/temp_main_widget.dart';
import '../widgets/visibility_main_widget.dart';
import '../widgets/wind_main_widget.dart';

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
