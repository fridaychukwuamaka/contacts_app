part of 'extension.dart';

extension ContextExtension on BuildContext {
  double get textScaleFactor => MediaQuery.of(this).textScaleFactor;
  // get the width of the screen
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
  double get bottom => MediaQuery.viewPaddingOf(this).bottom == 0
      ? appPaddingVal
      : MediaQuery.viewPaddingOf(this).bottom;

  double get top => MediaQuery.of(this).viewPadding.top == 0
      ? appPaddingVal
      : MediaQuery.viewPaddingOf(this).top;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  // run a function with a loading overlay
  Future<void> runWithLoading(Function() onCall) async {
    late OverlayEntry overlay;
    try {
      overlay = AppOverlay.showLoading(this);
      await onCall();
    } finally {
      AppOverlay.dismiss(overlay);
    }
  }
}
