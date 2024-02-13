import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/app_text_style.dart';
import '../contacts/widgets/contact_list_widget.dart';
import 'contact_search_viewmodel.dart';

class ContactSearchView extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  TextStyle? get searchFieldStyle => AppTextStyle.subtitle.copyWith(
        fontWeight: FontWeight.w600,
      );

  @override
  String? get searchFieldLabel => 'Search for contacts';

  @override
  Widget buildLeading(BuildContext context) {
    return const BackButton();
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search logic here
    return SearchList(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SearchList(query: query);
  }
}

class SearchList extends StatelessWidget {
  const SearchList({
    required this.query,
    super.key,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Text('Search for contacts'),
      );
    }
    return ViewModelBuilder<ContactSearchViewModel>.reactive(
      builder: (context, viewModel, child) {
        viewModel.search(query);
        if (viewModel.isBusy) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (viewModel.hasError) {
          return const Center(
            child: Text('An error occurred'),
          );
        }
        final contacts = viewModel.data ?? [];
        if (contacts.isEmpty) {
          return const Center(
            child: Text('No contacts found'),
          );
        }
        return ContactListWidget(
          contacts: contacts,
          onContactTap: viewModel.navigateToContactDetails,
        );
      },
      viewModelBuilder: ContactSearchViewModel.new,
    );
  }
}
