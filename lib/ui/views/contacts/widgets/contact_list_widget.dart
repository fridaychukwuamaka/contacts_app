import 'package:flutter/material.dart';

import '../../../../models/contact/contact.dart';
import '../../../common/ui_helpers.dart';
import 'contact_tile.dart';

class ContactListWidget extends StatelessWidget {
  const ContactListWidget({
    required this.contacts,
    required this.onContactTap,
    super.key,
  });

  final List<Contact> contacts;
  final Function(Contact) onContactTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(appPaddingVal),
      itemCount: contacts.length,
      separatorBuilder: (context, index) => verticalSpaceSmall,
      itemBuilder: (context, index) {
        final contact = contacts[index];
        return ContactTile(onContactTap: onContactTap, contact: contact);
      },
    );
  }
}
