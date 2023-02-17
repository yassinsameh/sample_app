import 'package:flutter/material.dart';
import 'package:innoscripta_demo/core/errors/messages.dart';

class GeneralError extends StatelessWidget {
  const GeneralError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(ErrorMessages.genericError),
      ),
    );
  }
}
