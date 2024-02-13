import '../app/app.locator.dart';
import '../models/contact/contact.dart';
import '../repositories/cached_contact_repository.dart';

class ContactService {
  ContactService()
      : _cachedContactRepository = locator<CachedContactRepository>();
  final CachedContactRepository _cachedContactRepository;

  Stream<List<Contact>> contactsStream() {
    return _cachedContactRepository.contactsStream();
  }

  Future<List<Contact>> getContacts() async {
    return _cachedContactRepository.getContacts();
  }

  Future<Contact> createContact(Contact contact) async {
    return _cachedContactRepository.createContact(contact);
  }

  Future<Contact> updateContact(Contact contact) async {
    return _cachedContactRepository.updateContact(contact);
  }

  Future<void> deleteContact(String id) async {
    return _cachedContactRepository.deleteContact(id);
  }

  Future<List<Contact>> searchContacts(String query) async {
    final contacts = await _cachedContactRepository.getContacts();
    return contacts
        .where((contact) =>
            contact.firstName.toLowerCase().contains(query.toLowerCase()) ||
            contact.lastName.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
