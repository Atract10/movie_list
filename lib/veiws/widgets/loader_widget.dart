import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Column(
        children: const <Widget>[
          Spacer(),
          CircularProgressIndicator(),
          Spacer(),
        ],
      ),
    );
  }
}