import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:texido_app/constants/app_constants.dart';

class CustomField extends StatelessWidget {
  final String hint;
  final double hintSize;
  final TextEditingController fieldController;
  final bool filled;
  final Color filledColor;
  final Color borderColor;
  final Color hintColor;
  final bool obscureText;
  final Widget prefix;
  final Widget suffix;
  final double vertical;
  final Function validate;
  final Function onChanged;
  final Function onSubmit;
  final bool enabled;
  final bool autoValidate;
  final bool errorText;
  CustomField({
    this.hint,
    this.hintSize,
    this.fieldController,
    this.filled = false,
    this.filledColor = greyColor01,
    this.borderColor = borderColor01,
    this.hintColor = hintColor01,
    this.obscureText = false,
    this.prefix,
    this.suffix,
    this.vertical,
    this.validate,
    this.onChanged,
    this.onSubmit,
    this.enabled = false,
    this.autoValidate,
    this.errorText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: fieldController,
      obscureText: obscureText,
      readOnly: enabled,
      style: TextStyle(
        color: hintColor,
        fontSize: hintSize != null ? font2 : font5,
        fontFamily: "Poppins",
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: size),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(6.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(6.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: redColor),
          borderRadius: BorderRadius.circular(6.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: redColor),
          borderRadius: BorderRadius.circular(6.0),
        ),
        filled: filled ? true : false,
        fillColor: filledColor == whiteColor ? filledColor : filledColor,
        hintText: hint,
        hintStyle: TextStyle(
            color: hintColor.withOpacity(0.5),
            fontSize: hintSize != null ? font1 : font4),
        prefixIcon: prefix,
        suffixIcon: suffix,
        errorStyle: TextStyle(
            color: Colors.redAccent,
            fontSize: size * 0.9,
            height: errorText ? 0.0 : null),
      ),
      autovalidateMode:
          autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      validator: validate,
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
    );
  }
}
