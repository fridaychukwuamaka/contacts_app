import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_text_style.dart';
import '../extensions/extension.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    required this.buttonTitle,
    required this.onPressed,
    super.key,
    this.isLoadable = true,
    this.width,
  });

  final String buttonTitle;
  final Function() onPressed;
  final bool isLoadable;
  final double? width;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextButton(
        onPressed: () async => context.runWithLoading(widget.onPressed),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          foregroundColor: context.colorScheme.onPrimary,
        ),
        child: Text(
          widget.buttonTitle,
          style: AppTextStyle.button,
        ),
      ),
    );
  }
}

class AppOutlineButton extends StatefulWidget {
  const AppOutlineButton({
    required this.buttonTitle,
    required this.onPressed,
    Key? key,
    this.isLoadable = true,
  }) : super(key: key);

  final String buttonTitle;
  final Function() onPressed;
  final bool isLoadable;

  @override
  State<AppOutlineButton> createState() => _AppOutlineButtonState();
}

class _AppOutlineButtonState extends State<AppOutlineButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async => context.runWithLoading(widget.onPressed),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        backgroundColor: Colors.transparent, // button color
        side: const BorderSide(
            color: AppColors.primary, width: 2), // border color and width
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        widget.buttonTitle,
        style: AppTextStyle.button,
      ),
    );
  }
}
