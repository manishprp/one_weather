import 'package:flutter/material.dart';
import '../model/location_model.dart';
import '../routes/screen_routes.dart';

import '../themes/app_colors.dart';
import '../themes/textstyles.dart';
import 'dot_widget.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar(
      {super.key,
      required this.title,
      required this.dotCount,
      required this.pageChanged});
  final List<LocationModel> dotCount;
  final String title;
  final Function pageChanged;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var isExpanded = false;
    var index = widget.dotCount
        .where(
          (element) => element.cityName == widget.title,
        )
        .toList()
        .first;

    widget.pageChanged(widget.dotCount.indexOf(index));

    return SliverAppBar(
      title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: AppTextStyle.kFcWhite,
            ),
            IndicatorWidget(dotCount: widget.dotCount, title: widget.title),
          ]),
      stretchTriggerOffset: 57,
      stretch: true,
      onStretchTrigger: () async {
        // setState(() {
        //   isExpanded = !isExpanded;
        // });
      },
      clipBehavior: Clip.antiAlias,
      expandedHeight: 56.5,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Container(),
        centerTitle: true,
      ),
      backgroundColor: AppColors.primaryColor,
      iconTheme: const IconThemeData(
        color: AppColors.textColor,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(
              ScreenRoutes.cityListScreen,
            );
          },
          icon: const Icon(Icons.list_alt),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }
}

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.dotCount,
    required this.title,
  });

  final List<LocationModel> dotCount;
  final String title;

  @override
  Widget build(BuildContext context) {
    var count = dotCount
        .where(
          (element) => element != dotCount[0],
        )
        .toList();
    return Row(
      children: [
        Icon(
          size: 14,
          Icons.location_pin,
          color: dotCount[0].cityName == title
              ? AppColors.textColor
              : AppColors.subTextColor,
        ),
        ...count.map(
          (e) => DotWidget(
            size: 8,
            spacing: 5,
            color: title == e.cityName
                ? AppColors.textColor
                : AppColors.subTextColor,
          ),
        )
      ],
    );
  }
}
