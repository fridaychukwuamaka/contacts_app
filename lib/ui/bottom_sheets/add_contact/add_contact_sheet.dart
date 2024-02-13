import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/app_text_style.dart';
import '../../common/extensions/extension.dart';
import '../../common/ui_helpers.dart';
import '../../common/utils/input_validation.dart';
import '../../common/widgets/app_button.dart';
import '../../common/widgets/app_input.dart';
import 'add_contact_sheet.form.dart';
import 'add_contact_sheet_model.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'firstName',
      validator: InputValidation.generic,
    ),
    FormTextField(
      name: 'lastName',
      validator: InputValidation.generic,
    ),
    FormTextField(
      name: 'phoneNumber',
      validator: InputValidation.phoneNumber,
    ),
    FormTextField(
      name: 'email',
      validator: InputValidation.email,
    ),
    FormTextField(
      name: 'relationship',
      validator: InputValidation.generic,
    ),
    FormTextField(
      name: 'note',
      validator: InputValidation.generic,
    ),
    FormTextField(
      name: 'nickname',
      validator: InputValidation.generic,
    ),
  ],
)
class AddContactSheet extends StackedView<AddContactSheetModel>
    with $AddContactSheet {
  const AddContactSheet({
    required this.completer,
    required this.request,
    Key? key,
  }) : super(key: key);
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  @override
  Widget builder(
    BuildContext context,
    AddContactSheetModel viewModel,
    Widget? child,
  ) {
    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ListView(
        padding: const EdgeInsets.all(appPaddingVal),
        shrinkWrap: true,
        children: [
          verticalSpaceSmall,
          Text(
            'Add Contact',
            style: AppTextStyle.subtitle.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          verticalSpaceMedium,
          Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                AppInput(
                  label: 'First Name',
                  controller: firstNameController,
                  validator: (s) => viewModel.firstNameValidationMessage,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                AppInput(
                  label: 'Last Name',
                  controller: lastNameController,
                  validator: (s) => viewModel.lastNameValidationMessage,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                AppInput(
                  label: 'Phone Number',
                  controller: phoneNumberController,
                  validator: (s) => viewModel.phoneNumberValidationMessage,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                AppInput(
                  label: 'Email',
                  controller: emailController,
                  validator: (s) => viewModel.emailValidationMessage,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                AppInput(
                  label: 'Nickname',
                  controller: nicknameController,
                  validator: (s) => viewModel.nicknameValidationMessage,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                AppInput(
                  label: 'Relationship',
                  controller: relationshipController,
                  validator: (s) => viewModel.relationshipValidationMessage,
                  textInputAction: TextInputAction.next,
                ),
                verticalSpaceMedium,
                AppInput(
                  label: 'Note',
                  controller: noteController,
                  validator: (s) => viewModel.noteValidationMessage,
                  onFieldSubmitted: (_) => viewModel.saveContact(),
                  textInputAction: TextInputAction.done,
                ),
                verticalSpaceMedium,
                AppButton(
                  width: double.infinity,
                  onPressed: viewModel.saveContact,
                  buttonTitle: 'Save',
                ),
                verticalSpace(context.bottom),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onDispose(AddContactSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(AddContactSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  AddContactSheetModel viewModelBuilder(BuildContext context) =>
      AddContactSheetModel();
}
