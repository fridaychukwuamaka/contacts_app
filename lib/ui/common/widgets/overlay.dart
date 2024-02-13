import 'package:flutter/material.dart';
import 'loader_widget.dart';

class AppOverlay {
  static void dismiss(OverlayEntry overlay) {
    overlay.remove();
  }

  // static Future<T?> showBottomModal<T>(Widget child) {
  //   if (navigatorKey?.currentContext == null) {
  //     return Future.value();
  //   }
  //   return showModalBottomSheet<T>(
  //       context: navigatorKey!.currentContext!,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: AppStyle.dialogBorderRadius,
  //       ),
  //       builder: (context) => child);
  // }

  static OverlayEntry showLoading(BuildContext context) {
    final overlay = Overlay.of(context);
    final OverlayEntry entry = OverlayEntry(builder: (_) {
      return Material(
        color: Colors.black.withOpacity(0.9),
        child: const Center(
          child: AppLoadingIndicator(),
        ),
      );
    });
    overlay.insert(entry);
    return entry;
  }
}
