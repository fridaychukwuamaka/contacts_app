import 'package:flutter/material.dart';

import '../../../../models/contact/contact.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    required this.onContactTap,
    required this.contact,
    super.key,
  });

  final Function(Contact p1) onContactTap;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onContactTap(contact),
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        child: Text(contact.initials),
      ),
      title: Text('${contact.firstName} ${contact.lastName}'),
      subtitle: Text(contact.nickname ?? contact.email),
    );
  }
}
