import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:innoscripta_demo/core/component_widgets/primary_button.dart';
import 'package:innoscripta_demo/core/errors/messages.dart';

import '../../theme/shapes.dart';

class GeneralError extends ConsumerWidget {
  final String? message;
  final VoidCallback? onPressed;
  const GeneralError({this.onPressed, this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Shapes.screenHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                message ?? ErrorMessages.genericError,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            if (onPressed != null)
              PrimaryButton(
                text: "Try again",
                onPressed: onPressed!,
              )
          ],
        ),
      ),
    );
  }
}
