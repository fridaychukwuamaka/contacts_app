import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../models/contact/contact.dart';
import '../../../services/contact_service.dart';

class ContactsViewModel extends StreamViewModel<List<Contact>> {
  final _navigationService = locator<NavigationService>();
  final _contactService = locator<ContactService>();
  final _logger = getLogger('ContactsViewModel');

  @override
  Stream<List<Contact>> get stream => _contactService.contactsStream();

  void navigateToContactDetails(Contact contact) {
    // Navigate to the contact details view
    _navigationService.navigateToContactDetailsView(contact: contact);
  }

  Future<void> getInitialContacts() async {
    // Fetch the initial contacts
    final val = await _contactService.getContacts();
    _logger.v('Initial contacts fetched $val');
    data = val;
    notifyListeners();
  }
}
