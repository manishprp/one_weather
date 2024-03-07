import 'package:flutter/material.dart';

class HorizontalDataCardRowWidget extends StatelessWidget {
  const HorizontalDataCardRowWidget({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }
}
