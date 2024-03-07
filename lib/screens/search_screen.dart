import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/citites_bloc.dart';
import '../bloc/internet_bloc.dart';
import '../model/location_model.dart';
import 'screen_base.dart';
import '../themes/app_space_constants.dart';
import '../themes/textstyles.dart';
import '../widgets/loader_widget.dart';

import '../bloc/coordinates_bloc.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

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
      body: ScreenBase(
        onInternetConnected: () {},
        child: SafeArea(
          child: Column(
            children: [
              SearchBar(
                hintText: "Search for city name",
                controller: _searchController,
                onChanged: (value) async {
                  await Future.delayed(const Duration(seconds: 3)).whenComplete(
                    () => context.read<CoordinatesBloc>().add(
                          CoordinatedFetchFromCityNameEvent(value),
                        ),
                  );
                },
                trailing: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                      });
                    },
                    icon: const Icon(
                      Icons.clear,
                      size: 30,
                    ),
                  )
                ],
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
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    context.read<CititesBloc>().add(
                                          CityAddedEvent(
                                            LocationModel(
                                                e.latitude,
                                                e.longitude,
                                                _searchController.text),
                                          ),
                                        );
                                    Navigator.pop(context);
                                  },
                                  child: ListTile(
                                    title: Text(
                                      "Latitude :${e.latitude}, Longitude :${e.longitude}",
                                    ),
                                  ),
                                ))
                            .toList());
                  } else if (state is CoordinatesError) {
                    return Container(
                      child: const Text(
                        "Hey, search for any other city",
                        style: AppTextStyle.kFs25,
                      ),
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
