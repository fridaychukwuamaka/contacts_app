import 'package:flutter_test/flutter_test.dart';
import 'package:contacts_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AppDbServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
