import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../theme/palette.dart';
import '../theme/shapes.dart';
import '../theme/theme.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?) validation;
  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final TextAlignVertical? textAlignVertical;

  // final Widget? labelWidget;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool expands;
  final bool? alignLabelWithHint;

  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final Function()? closeOnPressed;
  final bool showError;
  final TextInputAction? textInputAction;
  final FloatingLabelAlignment? floatingLabelAlignment;
  final double? labelHeight;

  EdgeInsets contentPadding;

  InputField(
      {this.controller,
      required this.labelText,
      required this.validation,
      this.focusNode,
      this.textInputAction,
      this.onEditingComplete,
      this.showError = true,
      this.onChanged,

      ///For forms setstate inpage to change borders
      this.onTap,
      this.closeOnPressed,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.textCapitalization = TextCapitalization.words,
      this.contentPadding = const EdgeInsets.fromLTRB(12, 26, 12, 16),
      this.maxLines,
      this.minLines,
      this.textAlignVertical,
      // this.labelWidget,
      this.floatingLabelBehavior,
      this.floatingLabelAlignment,
      this.expands = false,
      this.alignLabelWithHint,
      this.labelHeight,
      Key? key})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String error = "";
  @override
  void initState() {
    super.initState();
    widget.focusNode?.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    widget.focusNode?.removeListener(_onFocusChange);

    ///Disposing occurs in parent page better to keep everything in once place
    /// where it was created
  }

  ///needed to update focuses
  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.all(
                  Radius.circular(Shapes.inputFieldBorderRadius)),
              border: widget.readOnly
                  ? Border.all(width: 0, color: Colors.transparent)
                  : Border.all(
                      width: 2,
                      color: error.isNotEmpty && widget.showError
                          ? Palette.errorColor
                          : widget.focusNode?.hasFocus ?? false
                              ? Palette.primaryColor1
                              : Colors.transparent)),
          child: TextFormField(
            controller: widget.controller,
            validator: (val) {
              final result = widget.validation(val);
              setState(() {
                error = result ?? "";
              });
              return result;
            },
            onChanged: (val) {
              setState(() {});
              if (widget.onChanged != null) {
                widget.onChanged!(val);
              }
            },
            onTap: widget.onTap,
            readOnly: widget.readOnly,
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction,
            textCapitalization: widget.textCapitalization,
            keyboardType: widget.keyboardType,
            textAlignVertical:
                widget.textAlignVertical ?? TextAlignVertical.bottom,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            expands: widget.expands,
            decoration: InputDecoration(
                floatingLabelBehavior: widget.floatingLabelBehavior,
                floatingLabelAlignment: widget.floatingLabelAlignment,
                contentPadding: widget.contentPadding,
                alignLabelWithHint: widget.alignLabelWithHint,
                errorText: "",
                errorStyle: AppThemeData.hiddenErrorTextStyle,
                labelText: widget.labelText,
                labelStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 14, color: Palette.inputFieldHint, height: 5),
                floatingLabelStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Palette.inputFieldHint,
                        height: widget.labelHeight ?? 6),
                filled: true,
                fillColor: Palette.inputFieldColor,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                        Radius.circular(Shapes.inputFieldBorderRadius))),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                        Radius.circular(Shapes.inputFieldBorderRadius))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                        Radius.circular(Shapes.inputFieldBorderRadius))),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                        Radius.circular(Shapes.inputFieldBorderRadius))),
                suffixIcon: widget.controller?.text.trim().isEmpty ?? true
                    ? null
                    : IconButton(
                        icon: const Icon(
                          Icons.close,
                          size: 20,
                          color: Palette.black1,
                        ),
                        onPressed: widget.closeOnPressed,
                      )),
          ),
        ),
        if (error.isNotEmpty && widget.showError)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8.0),
            child: Text(
              error,
              style: AppThemeData.visibleErrorTextStyle,
            ),
          )
      ],
    );
  }
}
