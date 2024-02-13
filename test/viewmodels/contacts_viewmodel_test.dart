import 'package:contacts_app/app/app.locator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ContactsViewModel Tests -', () {
    setUp(registerServices);
    tearDown(locator.reset);
  });
}
