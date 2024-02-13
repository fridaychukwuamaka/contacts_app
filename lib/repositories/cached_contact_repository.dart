import '../app/app.locator.dart';

import '../models/contact/contact.dart';
import '../services/app_db_service.dart';
import 'contact_repository.dart';

class CachedContactRepository implements ContactRepository {
  CachedContactRepository() : _appDbService = locator<AppDbService>();

  final AppDbService _appDbService;

  @override
  Future<Contact> createContact(Contact contact) async {
    await _appDbService.insertData<Contact>(
      Contact.boxName,
      contact,
      contact.id,
    );
    return contact;
  }

  @override
  Future<void> deleteContact(String id) {
    return _appDbService.deleteData<Contact>(Contact.boxName, id);
  }

  @override
  Future<List<Contact>> getContacts() {
    return Future.value(_appDbService.readAllData<Contact>(Contact.boxName));
  }

  @override
  Future<Contact> updateContact(Contact contact) async {
    await _appDbService.updateData<Contact>(
      Contact.boxName,
      contact.id,
      contact,
    );
    return contact;
  }

  @override
  Stream<List<Contact>> contactsStream() {
    return _appDbService.watchAllData<Contact>(Contact.boxName);
  }
}
