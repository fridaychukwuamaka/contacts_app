// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:contacts_app/models/contact/contact.dart' as _i5;
import 'package:contacts_app/ui/views/contact_details/contact_details_view.dart'
    as _i3;
import 'package:contacts_app/ui/views/contacts/contacts_view.dart' as _i2;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const contactsView = '/contacts-view';

  static const contactDetailsView = '/contact-details-view';

  static const all = <String>{
    contactsView,
    contactDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.contactsView,
      page: _i2.ContactsView,
    ),
    _i1.RouteDef(
      Routes.contactDetailsView,
      page: _i3.ContactDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.ContactsView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.ContactsView(),
        settings: data,
      );
    },
    _i3.ContactDetailsView: (data) {
      final args = data.getArgs<ContactDetailsViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) =>
            _i3.ContactDetailsView(contact: args.contact, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class ContactDetailsViewArguments {
  const ContactDetailsViewArguments({
    required this.contact,
    this.key,
  });

  final _i5.Contact contact;

  final _i4.Key? key;

  @override
  String toString() {
    return '{"contact": "$contact", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ContactDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.contact == contact && other.key == key;
  }

  @override
  int get hashCode {
    return contact.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToContactsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.contactsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToContactDetailsView({
    required _i5.Contact contact,
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.contactDetailsView,
        arguments: ContactDetailsViewArguments(contact: contact, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.contactsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithContactDetailsView({
    required _i5.Contact contact,
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.contactDetailsView,
        arguments: ContactDetailsViewArguments(contact: contact, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
