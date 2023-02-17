import 'package:flutter/material.dart';

import '../theme/palette.dart';
import '../theme/shapes.dart';
import 'loading.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final bool showArrows;
  final String text;
  final bool isLoading;
  final bool forceNoHeight;
  final double bottomPadding;
  final double horizontalPadding;
  final double? width;
  final double? height;
  final double borderWidth;
  final TextStyle? textStyle;

  const PrimaryButton(
      {required this.onPressed,
      this.buttonColor = Palette.primaryColor1,
      this.borderColor = Palette.primaryColor1,
      this.textColor = Palette.whiteText,
      this.showArrows = false,
      this.text = "Let's go",
      this.isLoading = false,
      this.bottomPadding = 15,
      this.width,
      this.height,
      this.horizontalPadding = 0,
      this.borderWidth = 1.5,
      this.textStyle,
      this.forceNoHeight = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: bottomPadding,
          left: horizontalPadding,
          right: horizontalPadding),
      child: Container(
        height: height ?? (forceNoHeight ? null : 64),
        width: width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Palette.primaryColor1,
              Palette.primaryColor2,
            ]),
            borderRadius:
                BorderRadius.all(Radius.circular(Shapes.buttonBorderRadius))),
        child: ElevatedButton(
            onPressed: isLoading ? () {} : onPressed,
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Shapes.buttonBorderRadius),
                    side: BorderSide(color: borderColor, width: borderWidth))),
                backgroundColor: MaterialStateProperty.all(buttonColor)),
            child: isLoading
                ? const Center(
                    child: LoadingIndicator(color: Colors.white),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(
                          text,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          style: textStyle ??
                              Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(color: textColor),
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
