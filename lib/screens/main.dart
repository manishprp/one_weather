import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_instances.dart';
import '../themes/app_colors.dart';
import '../themes/textstyles.dart';
import 'weather_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocInstances(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'One_Weather',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.primaryColor,
            appBarTheme: const AppBarTheme(
              centerTitle: false,
            ),
            textTheme: const TextTheme(
              bodyLarge: AppTextStyle.kFs25,
            ),
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            useMaterial3: true,
          ),
          home: WeatherHomePage(title: "Silvassa")),
    );
  }
}
