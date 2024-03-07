import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../themes/textstyles.dart';
import '../widgets/loader_widget.dart';
import '../bloc/internet_bloc.dart';

class ScreenBase extends StatelessWidget {
  ScreenBase(
      {super.key, required this.child, required this.onInternetConnected});
  final Widget child;
  bool internetConnected = false;
  Function onInternetConnected;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is InternetInitial) {
          return const LoaderWidget();
        } else if (state is InternetDisconnected) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "No Internet Connected!",
                  style: AppTextStyle.kFs25,
                ),
                ElevatedButton(
                    onPressed: () {
                      context.read<InternetBloc>().add(CheckInternetEvent());
                    },
                    child: const Text("Retry"))
              ],
            ),
          );
        } else {
          onInternetConnected();
          return child;
        }
      },
    );
  }
}
