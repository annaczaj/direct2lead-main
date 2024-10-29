import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_profile_admin_widget.dart' show EditProfileAdminWidget;
import 'package:flutter/material.dart';

class EditProfileAdminModel extends FlutterFlowModel<EditProfileAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for company widget.
  FocusNode? companyFocusNode;
  TextEditingController? companyTextController;
  String? Function(BuildContext, String?)? companyTextControllerValidator;
  // State field(s) for lendorOrRealtor widget.
  FormFieldController<List<String>>? lendorOrRealtorValueController;
  String? get lendorOrRealtorValue =>
      lendorOrRealtorValueController?.value?.firstOrNull;
  set lendorOrRealtorValue(String? val) =>
      lendorOrRealtorValueController?.value = val != null ? [val] : [];
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for language widget.
  FormFieldController<List<String>>? languageValueController;
  List<String>? get languageValues => languageValueController?.value;
  set languageValues(List<String>? val) => languageValueController?.value = val;
  // State field(s) for coverageAreas widget.
  FormFieldController<List<String>>? coverageAreasValueController;
  List<String>? get coverageAreasValues => coverageAreasValueController?.value;
  set coverageAreasValues(List<String>? val) =>
      coverageAreasValueController?.value = val;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    companyFocusNode?.dispose();
    companyTextController?.dispose();
  }
}
