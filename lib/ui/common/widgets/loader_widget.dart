import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../extensions/extension.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.horizontalRotatingDots(
      color: context.colorScheme.primary,
      size: 50,
    );
  }
}
