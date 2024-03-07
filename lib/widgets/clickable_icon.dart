import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  const IconButton({super.key, required this.iconData});
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Icon(iconData);
  }
}
