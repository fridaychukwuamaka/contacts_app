import '../models/contact/contact.dart';

abstract class ContactRepository {
  Future<List<Contact>> getContacts();
  Future<Contact> createContact(Contact contact);
  Future<Contact> updateContact(Contact contact);
  Future<void> deleteContact(String id);
  Stream<List<Contact>> contactsStream();
}
