import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../../models/contact/contact.dart';
import '../../../services/contact_service.dart';

class ContactSearchViewModel extends FutureViewModel<List<Contact>> {
  final _contactService = locator<ContactService>();
  final _navigationService = locator<NavigationService>();

  @override
  Future<List<Contact>> futureToRun() async => [];

  Future<void> search(String query) async {
    final val = await _contactService.searchContacts(query);
    data = val;
  }

  void navigateToContactDetails(Contact contact) {
    _navigationService.navigateToContactDetailsView(contact: contact);
  }
}
