import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      required this.child,
      this.width,
      this.onPressed,
      this.onLongPressed});
  final Widget child;
  final double? width;
  final Function()? onPressed;
  final Function()? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: InkWell(
        radius: 40,
        onLongPress: onLongPressed,
        onTap: onPressed,
        child: Container(
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0.2),
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 10,
                  blurStyle: BlurStyle.solid),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}
