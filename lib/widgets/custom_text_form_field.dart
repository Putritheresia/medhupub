import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static OutlineInputBorder get outlinePink => OutlineInputBorder(
    borderRadius: BorderRadius.circular(28.h),
    borderSide: BorderSide(
      color: appTheme.pink400,
      width: 1,
    ),
  );
  static OutlineInputBorder get outlinePink1 => OutlineInputBorder(
    borderSide: BorderSide(
      color: appTheme.pink400,
      width: 1,
    ),
  );
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
    {
      Key? key,
      this.alignment,
      this.width,
      this.scrollPadding,
      this.focusNode,
      this.autofocus = false,
      this.textStyle,
      this.obscureText = false,
      this.textInputAction = TextInputAction.next,
      this.textInputType = TextInputType.text,
      this.maxLines,
      this.hintText,
      this.hintStyle,
      this.prefix,
      this.prefixConstraints,
      this.suffix,
      this.suffixConstraints,
      this.contentPadding,
      this.borderDecoration,
      this.fillColor,
      this.filled = false,
      this.validator, 
      this.controller
    }
  ) : super (
    key:key,
  );

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColor;
  final bool? filled;
  final FormFieldValidator<String>? validator;

  @override 
  Widget build(BuildContext context) {
    return alignment != null ? Align(
      alignment: alignment ?? Alignment.center,
      child: textFormFieldWidget(context))
      : textFormFieldWidget(context);
  }

  Widget textFormFieldWidget(BuildContext context) => SizedBox(
    width: width ?? double.maxFinite,
    child: TextFormField(
      scrollPadding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom),
      controller: controller,
      focusNode: focusNode,
      onTapOutside: (event) {
        if (focusNode != null) {
          focusNode?.unfocus();
        } else {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      autofocus: autofocus!,
      style: textStyle,
      obscureText: obscureText!,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      maxLines: maxLines ?? 1,
      decoration: decoration,
      validator: validator,
    ),
  );

  InputDecoration get decoration => InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle,
    prefixIcon: prefix,
    prefixIconConstraints: prefixConstraints,
    suffixIcon: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding,
    fillColor: fillColor,
    filled: filled,
    border: borderDecoration ?? 
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.h),
        borderSide: BorderSide(
          color: appTheme.pink400,
          width: 1,
        ),
      ),
  enabledBorder: borderDecoration ??
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.h),
      borderSide: BorderSide(
        color: appTheme.pink400,
        width: 1,
      ),
    ),
  focusedBorder: borderDecoration ??
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.h),
      borderSide: BorderSide(
        color: appTheme.pink400,
        width: 1,
      ),
    ),
  );
}