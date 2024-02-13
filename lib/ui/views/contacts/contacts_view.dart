import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.bottomsheets.dart';
import '../../../app/app.locator.dart';
import '../contact_search/contact_search_view.dart';

import 'contacts_viewmodel.dart';
import 'widgets/contact_list_widget.dart';
import 'widgets/no_contacts_widget.dart';

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: ContactSearchView(),
              );
            },
            icon: const Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: ViewModelBuilder<ContactsViewModel>.reactive(
        builder: (context, viewModel, child) {
          final contacts = viewModel.data ?? [];
          if (contacts.isEmpty) {
            return const NoContactsWidget();
          }
          return ContactListWidget(
            contacts: contacts,
            onContactTap: viewModel.navigateToContactDetails,
          );
        },
        viewModelBuilder: ContactsViewModel.new,
        onViewModelReady: (viewModel) => viewModel.getInitialContacts(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final bottomSheetService = locator<BottomSheetService>();
          bottomSheetService.showCustomSheet(
            variant: BottomSheetType.addContact,
            isScrollControlled: true,
            barrierDismissible: true,
            
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
