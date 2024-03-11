import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/internet_bloc.dart';
import '../bloc/current_index_bloc.dart';
import '../themes/app_space_constants.dart';
import '../widgets/card_widget.dart';
import '../widgets/city_list_widget.dart';
import '../routes/screen_routes.dart';
import '../themes/textstyles.dart';
import '../bloc/citites_bloc.dart';
import '../themes/app_colors.dart';
import '../model/location_model.dart';

class ManageCitiesScreen extends StatefulWidget {
  const ManageCitiesScreen({super.key});

  @override
  State<ManageCitiesScreen> createState() => _ManageCitiesScreenState();
}

bool visible = false;
bool mainCheckBoxValue = false;
bool isDeleted = false;

class _ManageCitiesScreenState extends State<ManageCitiesScreen> {
  @override
  Widget build(BuildContext context) {
    var data = context.watch<CititesBloc>().state;
    return Scaffold(
      bottomSheet: visible
          ? SizedBox(
              height: 60,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                IconButton(
                  onPressed: () {
                    List<int> indexesTDelete = [];
                    for (int i = 0; i < data.length; i++) {
                      if (data[i].visible) {
                        indexesTDelete.add(i);
                      }
                    }
                    setState(() {
                      context
                          .read<CititesBloc>()
                          .add(CityRemovedSelectedEvent(indexesTDelete));
                      visible = !visible;
                    });
                    isDeleted = true;
                  },
                  icon: const Icon(
                    Icons.delete,
                    size: 35,
                  ),
                )
              ]),
            )
          : null,
      floatingActionButton: visible
          ? null
          : FloatingActionButton(
              backgroundColor: AppColors.subTextColor,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ScreenRoutes.searchScreen,
                );
              },
              child: const Icon(
                Icons.add,
                size: 30,
                color: AppColors.textColor,
              ),
            ),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (isDeleted) {
                context.read<InternetBloc>().add(
                      CheckInternetEvent(),
                    );
                context.read<CurrentIndexBloc>().add(
                      CurrentIndexChangedEvent(0),
                    );
              }
            },
            icon: const Icon(
              Icons.navigate_before,
              color: AppColors.textColor,
              size: 30,
            )),
        title: const Text(
          "Manage Cities",
          textAlign: TextAlign.start,
          style: AppTextStyle.kFs25,
        ),
        actions: [
          visible
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                      _toggleAll(data, false);
                      mainCheckBoxValue = true;
                    });
                  },
                  icon: const Text(
                    "cancel",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ))
              : Container(),
          visible
              ? Checkbox(
                  value: mainCheckBoxValue,
                  onChanged: (value) {
                    setState(() {
                      mainCheckBoxValue = !mainCheckBoxValue;
                      _toggleAll(data, mainCheckBoxValue);
                    });
                  })
              : IconButton(
                  onPressed: () {
                    setState(() {
                      visible = !visible;
                      _toggleAll(data, true);
                    });
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.textColor,
                    size: 25,
                  ),
                ),
        ],
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: ListView.separated(
          separatorBuilder: (context, index) => AppSpaceConstants.kGapH20,
          itemCount: context.watch<CititesBloc>().state.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CardWidget(
              onLongPressed: () {
                if (visible) return;
                setState(() {
                  visible = !visible;
                });
              },
              onPressed: () {
                if (visible) {
                  setState(() {
                    data[index].visible = !data[index].visible;
                  });
                } else {
                  context.read<CurrentIndexBloc>().add(
                        CurrentIndexChangedEvent(index),
                      );
                  Navigator.of(context).pop();
                }
              },
              child: CityListItemWidget(
                onCheckbxToggled: (p0) {
                  setState(() {
                    data[index].visible = !data[index].visible;
                  });
                },
                allVisible: visible,
                visible: data[index].visible,
                latitude: data[index].latitude,
                longitude: data[index].longitude,
                city: data[index].cityName ?? "",
              ),
            );
          },
        ),
      ),
    );
  }

  void _toggleAll(List<LocationModel> data, bool ans) {
    for (int i = 0; i < data.length; i++) {
      data[i].visible = ans;
    }
  }
}
