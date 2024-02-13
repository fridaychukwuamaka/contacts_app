import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:uuid/uuid.dart';

import '../../../app/app.locator.dart';
import '../../../models/contact/contact.dart';
import '../../../services/contact_service.dart';
import '../../common/app_toast.dart';
import 'add_contact_sheet.form.dart';

class AddContactSheetModel extends FormViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _uuid = locator<Uuid>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _contactService = locator<ContactService>();

  Future<void> saveContact() async {
    if (formKey.currentState!.validate()) {
      final contact = Contact(
        id: _uuid.v4(),
        firstName: firstNameValue!,
        lastName: lastNameValue!,
        email: emailValue!,
        nickname: nicknameValue,
        note: noteValue,
        phoneNumber: phoneNumberValue!,
        relationship: relationshipValue,
      );
      await _contactService.createContact(contact);
      _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
      unawaited(AppToast.show('Contact added successfully!'));
    } else {}
  }
}
