import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  AppToast._();

  static Future<void> show(String message) async {
    await Fluttertoast.showToast(msg: message);
  }
}
