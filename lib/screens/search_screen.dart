import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/card_widget.dart';
import '../themes/app_colors.dart';
import '../bloc/citites_bloc.dart';
import '../bloc/internet_bloc.dart';
import '../model/location_model.dart';
import '../widgets/city_list_widget.dart';
import 'screen_base.dart';
import '../themes/app_space_constants.dart';
import '../themes/textstyles.dart';
import '../widgets/loader_widget.dart';

import '../bloc/coordinates_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController =
      TextEditingController(text: "");

  @override
  void initState() {
    super.initState();
    context.read<InternetBloc>().add(
          CheckInternetEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.navigate_before,
              color: AppColors.textColor,
              size: 30,
            )),
        title: const Text(
          "Search For City",
          textAlign: TextAlign.start,
          style: AppTextStyle.kFs25,
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: ScreenBase(
        onInternetConnected: () {},
        child: SafeArea(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                        icon: const Icon(Icons.clear)),
                    hintText: "Search for city name",
                    hintStyle: const TextStyle(
                      color: AppColors.subTextColor,
                    ),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    context.read<CoordinatesBloc>().add(
                          CoordinatedFetchFromCityNameEvent(value),
                        );
                  },
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              AppSpaceConstants.kGapH20,
              BlocBuilder<CoordinatesBloc, CoordinatesState>(
                builder: (context, state) {
                  if (_searchController.text.isEmpty) {
                    return Container();
                  } else if (state is CoordinatesFound) {
                    var data = state.locations;
                    return Column(
                        children: data
                            .map((e) => Column(
                                  children: [
                                    CardWidget(
                                      onPressed: () {
                                        context.read<CititesBloc>().add(
                                              CityAddedEvent(
                                                LocationModel(
                                                    e.latitude,
                                                    e.longitude,
                                                    _searchController.text),
                                              ),
                                            );
                                        Navigator.of(context).pop();
                                      },
                                      child: CityListItemWidget(
                                        latitude: e.latitude,
                                        longitude: e.longitude,
                                        city: _searchController.text,
                                      ),
                                    ),
                                    AppSpaceConstants.kGapH20
                                  ],
                                ))
                            .toList());
                  } else if (state is CoordinatesError) {
                    return const Text(
                      "Hey, search for any other city",
                      style: AppTextStyle.kFs25,
                    );
                  } else {
                    return const LoaderWidget();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
