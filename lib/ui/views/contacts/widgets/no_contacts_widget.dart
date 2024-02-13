import 'package:flutter/material.dart';

import '../../../common/app_text_style.dart';

class NoContactsWidget extends StatelessWidget {
  const NoContactsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'No contacts found',
      style: AppTextStyle.body2.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
