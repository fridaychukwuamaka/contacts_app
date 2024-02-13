// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:contacts_app/ui/common/utils/input_validation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String FirstNameValueKey = 'firstName';
const String LastNameValueKey = 'lastName';
const String PhoneNumberValueKey = 'phoneNumber';
const String EmailValueKey = 'email';
const String RelationshipValueKey = 'relationship';
const String NoteValueKey = 'note';
const String NicknameValueKey = 'nickname';

final Map<String, TextEditingController>
    _AddContactSheetTextEditingControllers = {};

final Map<String, FocusNode> _AddContactSheetFocusNodes = {};

final Map<String, String? Function(String?)?> _AddContactSheetTextValidations =
    {
  FirstNameValueKey: InputValidation.generic,
  LastNameValueKey: InputValidation.generic,
  PhoneNumberValueKey: InputValidation.phoneNumber,
  EmailValueKey: InputValidation.email,
  RelationshipValueKey: InputValidation.generic,
  NoteValueKey: InputValidation.generic,
  NicknameValueKey: InputValidation.generic,
};

mixin $AddContactSheet {
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get phoneNumberController =>
      _getFormTextEditingController(PhoneNumberValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get relationshipController =>
      _getFormTextEditingController(RelationshipValueKey);
  TextEditingController get noteController =>
      _getFormTextEditingController(NoteValueKey);
  TextEditingController get nicknameController =>
      _getFormTextEditingController(NicknameValueKey);

  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get phoneNumberFocusNode => _getFormFocusNode(PhoneNumberValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get relationshipFocusNode =>
      _getFormFocusNode(RelationshipValueKey);
  FocusNode get noteFocusNode => _getFormFocusNode(NoteValueKey);
  FocusNode get nicknameFocusNode => _getFormFocusNode(NicknameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddContactSheetTextEditingControllers.containsKey(key)) {
      return _AddContactSheetTextEditingControllers[key]!;
    }

    _AddContactSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddContactSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddContactSheetFocusNodes.containsKey(key)) {
      return _AddContactSheetFocusNodes[key]!;
    }
    _AddContactSheetFocusNodes[key] = FocusNode();
    return _AddContactSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    relationshipController.addListener(() => _updateFormData(model));
    noteController.addListener(() => _updateFormData(model));
    nicknameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    firstNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    phoneNumberController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    relationshipController.addListener(() => _updateFormData(model));
    noteController.addListener(() => _updateFormData(model));
    nicknameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FirstNameValueKey: firstNameController.text,
          LastNameValueKey: lastNameController.text,
          PhoneNumberValueKey: phoneNumberController.text,
          EmailValueKey: emailController.text,
          RelationshipValueKey: relationshipController.text,
          NoteValueKey: noteController.text,
          NicknameValueKey: nicknameController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddContactSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddContactSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _AddContactSheetTextEditingControllers.clear();
    _AddContactSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get phoneNumberValue =>
      this.formValueMap[PhoneNumberValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get relationshipValue =>
      this.formValueMap[RelationshipValueKey] as String?;
  String? get noteValue => this.formValueMap[NoteValueKey] as String?;
  String? get nicknameValue => this.formValueMap[NicknameValueKey] as String?;

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({FirstNameValueKey: value}),
    );

    if (_AddContactSheetTextEditingControllers.containsKey(FirstNameValueKey)) {
      _AddContactSheetTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LastNameValueKey: value}),
    );

    if (_AddContactSheetTextEditingControllers.containsKey(LastNameValueKey)) {
      _AddContactSheetTextEditingControllers[LastNameValueKey]?.text =
          value ?? '';
    }
  }

  set phoneNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({PhoneNumberValueKey: value}),
    );

    if (_AddContactSheetTextEditingControllers.containsKey(
        PhoneNumberValueKey)) {
      _AddContactSheetTextEditingControllers[PhoneNumberValueKey]?.text =
          value ?? '';
    }
  }

  set emailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({EmailValueKey: value}),
    );

    if (_AddContactSheetTextEditingControllers.containsKey(EmailValueKey)) {
      _AddContactSheetTextEditingControllers[EmailValueKey]?.text = value ?? '';
    }
  }

  set relationshipValue(String? value) {
    this.setData(
      this.formValueMap..addAll({RelationshipValueKey: value}),
    );

    if (_AddContactSheetTextEditingControllers.containsKey(
        RelationshipValueKey)) {
      _AddContactSheetTextEditingControllers[RelationshipValueKey]?.text =
          value ?? '';
    }
  }

  set noteValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NoteValueKey: value}),
    );

    if (_AddContactSheetTextEditingControllers.containsKey(NoteValueKey)) {
      _AddContactSheetTextEditingControllers[NoteValueKey]?.text = value ?? '';
    }
  }

  set nicknameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NicknameValueKey: value}),
    );

    if (_AddContactSheetTextEditingControllers.containsKey(NicknameValueKey)) {
      _AddContactSheetTextEditingControllers[NicknameValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasPhoneNumber =>
      this.formValueMap.containsKey(PhoneNumberValueKey) &&
      (phoneNumberValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasRelationship =>
      this.formValueMap.containsKey(RelationshipValueKey) &&
      (relationshipValue?.isNotEmpty ?? false);
  bool get hasNote =>
      this.formValueMap.containsKey(NoteValueKey) &&
      (noteValue?.isNotEmpty ?? false);
  bool get hasNickname =>
      this.formValueMap.containsKey(NicknameValueKey) &&
      (nicknameValue?.isNotEmpty ?? false);

  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasPhoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasRelationshipValidationMessage =>
      this.fieldsValidationMessages[RelationshipValueKey]?.isNotEmpty ?? false;
  bool get hasNoteValidationMessage =>
      this.fieldsValidationMessages[NoteValueKey]?.isNotEmpty ?? false;
  bool get hasNicknameValidationMessage =>
      this.fieldsValidationMessages[NicknameValueKey]?.isNotEmpty ?? false;

  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get phoneNumberValidationMessage =>
      this.fieldsValidationMessages[PhoneNumberValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get relationshipValidationMessage =>
      this.fieldsValidationMessages[RelationshipValueKey];
  String? get noteValidationMessage =>
      this.fieldsValidationMessages[NoteValueKey];
  String? get nicknameValidationMessage =>
      this.fieldsValidationMessages[NicknameValueKey];
}

extension Methods on FormStateHelper {
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setPhoneNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PhoneNumberValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setRelationshipValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[RelationshipValueKey] = validationMessage;
  setNoteValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NoteValueKey] = validationMessage;
  setNicknameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NicknameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    firstNameValue = '';
    lastNameValue = '';
    phoneNumberValue = '';
    emailValue = '';
    relationshipValue = '';
    noteValue = '';
    nicknameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      RelationshipValueKey: getValidationMessage(RelationshipValueKey),
      NoteValueKey: getValidationMessage(NoteValueKey),
      NicknameValueKey: getValidationMessage(NicknameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddContactSheetTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddContactSheetTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      FirstNameValueKey: getValidationMessage(FirstNameValueKey),
      LastNameValueKey: getValidationMessage(LastNameValueKey),
      PhoneNumberValueKey: getValidationMessage(PhoneNumberValueKey),
      EmailValueKey: getValidationMessage(EmailValueKey),
      RelationshipValueKey: getValidationMessage(RelationshipValueKey),
      NoteValueKey: getValidationMessage(NoteValueKey),
      NicknameValueKey: getValidationMessage(NicknameValueKey),
    });
