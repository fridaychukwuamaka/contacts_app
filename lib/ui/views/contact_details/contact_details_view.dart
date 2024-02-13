import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../../models/contact/contact.dart';
import '../../common/app_text_style.dart';
import '../../common/extensions/extension.dart';
import '../../common/ui_helpers.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_input.dart';
import 'contact_details_view.form.dart';
import 'contact_details_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
  FormTextField(name: 'phoneNumber'),
  FormTextField(name: 'email'),
  FormTextField(name: 'relationship'),
  FormTextField(name: 'note'),
  FormTextField(name: 'nickname'),
])
class ContactDetailsView extends StackedView<ContactDetailsViewModel>
    with $ContactDetailsView {
  const ContactDetailsView({
    required this.contact,
    Key? key,
  }) : super(key: key);

  final Contact contact;

  @override
  Widget builder(
    BuildContext context,
    ContactDetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Details'),
        actions: [
          IconButton(
            onPressed: () => viewModel.deleteContact(contact),
            icon: const Icon(FeatherIcons.trash2),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(appPaddingVal),
        children: [
          verticalSpaceMedium,
          CircleAvatar(
            radius: 50,
            child: Text(contact.initials),
          ),
          verticalSpaceMedium,
          Text(
            '${contact.firstName} ${contact.lastName}',
            textAlign: TextAlign.center,
            style: AppTextStyle.subtitle,
          ),
          verticalSpaceSmall,
          Text(
            contact.nickname ?? contact.email,
            textAlign: TextAlign.center,
            style: AppTextStyle.subtitle,
          ),
          verticalSpaceMedium,
          Column(
            children: [
              AppInput(
                label: 'First Name',
                controller: firstNameController,
              ),
              verticalSpaceMedium,
              AppInput(
                label: 'Last Name',
                controller: lastNameController,
              ),
              verticalSpaceMedium,
              AppInput(
                label: 'Phone Number',
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
              ),
              verticalSpaceMedium,
              AppInput(
                label: 'Email',
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              verticalSpaceMedium,
              AppInput(
                label: 'Nickname',
                controller: nicknameController,
              ),
              verticalSpaceMedium,
              AppInput(
                label: 'Relationship',
                controller: relationshipController,
              ),
              verticalSpaceMedium,
              AppInput(
                label: 'Note',
                controller: noteController,
              ),
              verticalSpaceMedium,
              SizedBox(
                width: double.infinity,
                child: AppButton(
                  onPressed: () => viewModel.updateContact(contact),
                  buttonTitle: 'Save',
                ),
              ),
              verticalSpace(context.bottom),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void onViewModelReady(ContactDetailsViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.setInitialContactData(contact);
  }

  @override
  ContactDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactDetailsViewModel();
}
