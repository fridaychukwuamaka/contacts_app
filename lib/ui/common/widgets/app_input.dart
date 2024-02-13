import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_text_style.dart';
import '../ui_helpers.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    this.label,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.textInputAction,
    this.onFieldSubmitted,
    this.keyboardType,
    super.key,
  });

  final TextEditingController? controller;
  final String? label;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: appPaddingVal,
          vertical: 18,
        ),
        labelText: label,
        labelStyle: AppTextStyle.body2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primary,
          ),
        ),
      ),
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: keyboardType,
    );
  }
}
