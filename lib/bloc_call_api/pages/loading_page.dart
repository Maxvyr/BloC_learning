import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final widthTotal = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: widthTotal * .3,
        height: widthTotal * .3,
        child: const CircularProgressIndicator(
          strokeWidth: 8.0,
        ),
      ),
    );
  }
}
