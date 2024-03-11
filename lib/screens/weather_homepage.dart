import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/citites_bloc.dart';
import '../bloc/current_index_bloc.dart';
import '../bloc/multi_weather_bloc.dart';
import '../model/location_model.dart';
import 'screen_base.dart';

import '../bloc/internet_bloc.dart';
import '../location_service/location_setup.dart';
import '../themes/app_colors.dart';
import '../themes/app_strings.dart';
import '../themes/textstyles.dart';
import '../widgets/app_bar.dart';
import '../widgets/loader_widget.dart';
import 'city_weather_screen.dart';

var degreeSymbol = AppString.degreeSymbol;
var colors = AppColors();
var textStyles = AppTextStyle();
LocationModel? data;
List<LocationModel> locationModels = [];
String pageTitle = "";
CarouselController _carouselController = CarouselController();
String curentCityName = "";

final List<Widget> items = [];

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});
  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  @override
  void initState() {
    super.initState();

    getLocation();
  }

  void getLocation() async {
    data = await getCurrentLocation();
    // ignore: use_build_context_synchronously
    context.read<InternetBloc>().add(CheckInternetEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBase(
        onInternetConnected: () => {
          locationModels = context.watch<CititesBloc>().state,
          if (locationModels.isEmpty)
            {
              context.read<CititesBloc>().add(
                    CityAddedEvent(
                        LocationModel(data!.latitude, data!.longitude, ""),
                        onTop: true),
                  ),
            },
          context.read<MultiWeatherBloc>().add(
                MultipleWeatherFetchedEvent(locationModels),
              ),
        },
        child: BlocBuilder<MultiWeatherBloc, MultiWeatherState>(
          builder: (context, state) {
            locationModels = context.watch<CititesBloc>().state;
            if (state is MultipleWeatherLoading) {
              return const LoaderWidget();
            }
            if (state is MultipleWeatherFailure) {
              return Center(
                  child: Text(
                state.error,
                style: AppTextStyle.kFs25,
              ));
            }
            if (state is MultipleWeatherSuccess) {
              var data = state.weatherData;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  CustomAppBar(
                      pageChanged: (index) => {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              _carouselController.jumpToPage(index);
                            })
                          },
                      dotCount: context.watch<CititesBloc>().state,
                      title: context
                              .watch<CititesBloc>()
                              .state[context.watch<CurrentIndexBloc>().state]
                              .cityName ??
                          ""),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return CarouselSlider(
                          carouselController: _carouselController,
                          items: data
                              .map(
                                (e) => CityWeatherWidget(
                                  data: e,
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                              initialPage:
                                  context.watch<CurrentIndexBloc>().state,
                              aspectRatio: 0.28,
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              reverse: false,
                              onPageChanged: (index, reason) {
                                context
                                    .read<CurrentIndexBloc>()
                                    .add(CurrentIndexChangedEvent(index));
                              },
                              enableInfiniteScroll: false,
                              animateToClosest: true),
                        );
                      },
                      childCount: 1,
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
