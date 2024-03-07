import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({super.key, required this.size, this.color, this.spacing});
  final double? spacing;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: spacing ?? 4),
      decoration: BoxDecoration(
        color: color ?? AppColors.subTextColor,
        borderRadius: BorderRadius.circular(size / 2),
      ),
      height: size,
      width: size,
    );
  }
}
