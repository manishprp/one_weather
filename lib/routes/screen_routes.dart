import 'package:flutter/material.dart';

import '../screens/manage_cities.dart';
import '../screens/search_screen.dart';
import '../screens/weather_homepage.dart';

class ScreenRoutes {
  ScreenRoutes._();

  static const String homeScreen = '/homeScreen';
  static const String cityListScreen = '/cityListScreen';
  static const String searchScreen = '/searchScreen';

  static final routes = <String, WidgetBuilder>{
    homeScreen: (BuildContext context) => const WeatherHomePage(),
    cityListScreen: (BuildContext context) => const ManageCitiesScreen(),
    searchScreen: (BuildContext context) => const SearchScreen(),
  };
}
