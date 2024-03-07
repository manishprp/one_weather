import 'package:flutter/material.dart';

import '../themes/textstyles.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: const BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Text(
        title,
        style: AppTextStyle.kFs25.copyWith(fontSize: 20),
      ),
    );
  }
}
