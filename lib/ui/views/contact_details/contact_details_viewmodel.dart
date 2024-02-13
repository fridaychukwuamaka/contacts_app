import 'dart:async';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../models/contact/contact.dart';
import '../../../services/contact_service.dart';
import '../../common/app_toast.dart';
import 'contact_details_view.form.dart';

class ContactDetailsViewModel extends FormViewModel {
  final _contactService = locator<ContactService>();
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('ContactDetailsViewModel');

  void setInitialContactData(Contact contact) {
    firstNameValue = contact.firstName;
    lastNameValue = contact.lastName;
    phoneNumberValue = contact.phoneNumber;
    emailValue = contact.email;
    relationshipValue = contact.relationship;
    noteValue = contact.note;
    nicknameValue = contact.nickname;
  }

  Future<void> updateContact(Contact contact) async {
    try {
      final updatedContact = contact.copyWith(
        firstName: firstNameValue!,
        lastName: lastNameValue!,
        phoneNumber: phoneNumberValue!,
        email: emailValue!,
        relationship: relationshipValue,
        note: noteValue,
        nickname: nicknameValue,
      );
      await _contactService.updateContact(updatedContact);
      unawaited(AppToast.show('Contact updated successfully!'));
    } on Exception catch (e) {
      _logger.e('Error updating contact', e);
    }
  }

  Future<void> deleteContact(Contact contact) async {
    try {
      await _contactService.deleteContact(contact.id);
      unawaited(AppToast.show('Contact deleted successfully!'));
      _navigationService.back();
    } on Exception catch (e) {
      _logger.e('Error deleting contact', e);
    }
  }
}
