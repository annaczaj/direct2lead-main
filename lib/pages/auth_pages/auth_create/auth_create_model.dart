import '/backend/backend.dart';
import '/components/main_logo_small/main_logo_small_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'auth_create_widget.dart' show AuthCreateWidget;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AuthCreateModel extends FlutterFlowModel<AuthCreateWidget> {
  ///  Local state fields for this page.

  List<String> devID = [];
  void addToDevID(String item) => devID.add(item);
  void removeFromDevID(String item) => devID.remove(item);
  void removeAtIndexFromDevID(int index) => devID.removeAt(index);
  void insertAtIndexInDevID(int index, String item) =>
      devID.insert(index, item);
  void updateDevIDAtIndex(int index, Function(String) updateFn) =>
      devID[index] = updateFn(devID[index]);

  List<String> adminID = [];
  void addToAdminID(String item) => adminID.add(item);
  void removeFromAdminID(String item) => adminID.remove(item);
  void removeAtIndexFromAdminID(int index) => adminID.removeAt(index);
  void insertAtIndexInAdminID(int index, String item) =>
      adminID.insert(index, item);
  void updateAdminIDAtIndex(int index, Function(String) updateFn) =>
      adminID[index] = updateFn(adminID[index]);

  List<String> groupID = [];
  void addToGroupID(String item) => groupID.add(item);
  void removeFromGroupID(String item) => groupID.remove(item);
  void removeAtIndexFromGroupID(int index) => groupID.removeAt(index);
  void insertAtIndexInGroupID(int index, String item) =>
      groupID.insert(index, item);
  void updateGroupIDAtIndex(int index, Function(String) updateFn) =>
      groupID[index] = updateFn(groupID[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in auth_Create widget.
  UpdateResourcesRecord? checkID;
  // Model for main_Logo_Small component.
  late MainLogoSmallModel mainLogoSmallModel;
  // State field(s) for displayName widget.
  FocusNode? displayNameFocusNode;
  TextEditingController? displayNameTextController;
  String? Function(BuildContext, String?)? displayNameTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for company widget.
  FocusNode? companyFocusNode;
  TextEditingController? companyTextController;
  String? Function(BuildContext, String?)? companyTextControllerValidator;
  // State field(s) for groupID widget.
  String? groupIDValue;
  FormFieldController<String>? groupIDValueController;
  // State field(s) for adminID widget.
  FocusNode? adminIDFocusNode;
  TextEditingController? adminIDTextController;
  String? Function(BuildContext, String?)? adminIDTextControllerValidator;
  // State field(s) for devID widget.
  FocusNode? devIDFocusNode;
  TextEditingController? devIDTextController;
  String? Function(BuildContext, String?)? devIDTextControllerValidator;
  // State field(s) for lendorOrRealtor widget.
  FormFieldController<List<String>>? lendorOrRealtorValueController;
  String? get lendorOrRealtorValue =>
      lendorOrRealtorValueController?.value?.firstOrNull;
  set lendorOrRealtorValue(String? val) =>
      lendorOrRealtorValueController?.value = val != null ? [val] : [];
  // State field(s) for language widget.
  FormFieldController<List<String>>? languageValueController;
  List<String>? get languageValues => languageValueController?.value;
  set languageValues(List<String>? val) => languageValueController?.value = val;
  // State field(s) for coverageAreas widget.
  FormFieldController<List<String>>? coverageAreasValueController;
  List<String>? get coverageAreasValues => coverageAreasValueController?.value;
  set coverageAreasValues(List<String>? val) =>
      coverageAreasValueController?.value = val;
  // State field(s) for podNum widget.
  FormFieldController<List<String>>? podNumValueController;
  String? get podNumValue => podNumValueController?.value?.firstOrNull;
  set podNumValue(String? val) =>
      podNumValueController?.value = val != null ? [val] : [];
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for passwordConfirm widget.
  FocusNode? passwordConfirmFocusNode;
  TextEditingController? passwordConfirmTextController;
  late bool passwordConfirmVisibility;
  String? Function(BuildContext, String?)?
      passwordConfirmTextControllerValidator;

  @override
  void initState(BuildContext context) {
    mainLogoSmallModel = createModel(context, () => MainLogoSmallModel());
    passwordVisibility = false;
    passwordConfirmVisibility = false;
  }

  @override
  void dispose() {
    mainLogoSmallModel.dispose();
    displayNameFocusNode?.dispose();
    displayNameTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    companyFocusNode?.dispose();
    companyTextController?.dispose();

    adminIDFocusNode?.dispose();
    adminIDTextController?.dispose();

    devIDFocusNode?.dispose();
    devIDTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    passwordConfirmFocusNode?.dispose();
    passwordConfirmTextController?.dispose();
  }
}
