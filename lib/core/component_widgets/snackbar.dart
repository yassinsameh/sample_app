import 'package:flutter/material.dart';

import '../navigation.dart';
import '../theme/palette.dart';

abstract class AppSnackbar {
  static void showSuccessSnackbar({required String text}) {
    final context = globalNavigatorKey.currentState?.context;
    if (context == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Palette.successColor,
      ),
    );
  }

  static void showErrorSnackbar({required String text}) {
    final context = globalNavigatorKey.currentState?.context;
    if (context == null) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Palette.errorColor,
      ),
    );
  }
}
