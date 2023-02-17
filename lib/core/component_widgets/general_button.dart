import 'package:flutter/material.dart';

import '../theme/palette.dart';
import '../theme/shapes.dart';

class GeneralButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? iconImage;
  final String? text;
  final TextStyle? style;
  final double? height;
  final double? width;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double borderWidth;
  final double verticalPadding;
  final Widget? customChild;
  final Widget? trailingCustom;
  final TextAlign textAlign;
  final bool isEnglish;
  final int? maxLines;
  final bool forceNoHeight;
  final bool disabled;
  final double contentVerticalPadding;
  final double contentHorizontalPadding;
  final double borderRadius;
  const GeneralButton(
      {required this.onPressed,
      required this.text,
      this.backgroundColor = Colors.transparent,
      this.borderColor = Palette.primaryColor1,
      this.borderWidth = 2.5,
      this.textColor = Palette.black1,
      this.verticalPadding = 0,
      this.textAlign = TextAlign.center,
      this.isEnglish = true,
      this.maxLines,
      this.forceNoHeight = false,
      this.disabled = false,
      this.style,
      this.iconImage,
      this.height,
      this.width,
      this.trailingCustom,
      this.customChild,
      this.contentVerticalPadding = 4,
      this.contentHorizontalPadding = 8,
      this.borderRadius = Shapes.buttonBorderRadius,
      Key? key})

      ///Must contain either text or a custom child
      : assert(text != null || customChild != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: SizedBox(
        height: height,
        width: width,
        child: ElevatedButton(
            onPressed: disabled ? null : onPressed,
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                    vertical: contentVerticalPadding,
                    horizontal: contentHorizontalPadding)),
                backgroundColor: MaterialStateProperty.all(backgroundColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(borderRadius)),
                    side: BorderSide(color: borderColor, width: borderWidth)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconImage != null)
                  Row(
                    children: [
                      SizedBox(height: 25, width: 25, child: iconImage!),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),

                ///Switch trailing direction if language is not english
                if (trailingCustom != null && !isEnglish) trailingCustom!,
                Flexible(
                  child: customChild ??
                      Text(
                        text!,
                        maxLines: maxLines,
                        style: style ??
                            Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: textColor,
                                ),
                        textAlign: textAlign,
                      ),
                ),

                if (trailingCustom != null && isEnglish) trailingCustom!,
              ],
            )),
      ),
    );
  }
}
