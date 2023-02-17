import 'package:flutter/material.dart';

class GeneralError extends StatelessWidget {
  const GeneralError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Something went wrong"),
      ),
    );
  }
}
