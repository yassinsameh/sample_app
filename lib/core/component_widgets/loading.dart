import 'package:flutter/material.dart';

import '../theme/palette.dart';

class LoadingIndicator extends StatelessWidget {
  final Color color;
  const LoadingIndicator({this.color = Palette.primaryColor1, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: color,
    ));
  }
}
