import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'main_contracts_widget.dart' show MainContractsWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MainContractsModel extends FlutterFlowModel<MainContractsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for webNav component.
  late WebNavModel webNavModel;
  // State field(s) for leadName widget.
  FocusNode? leadNameFocusNode;
  TextEditingController? leadNameTextController;
  String? Function(BuildContext, String?)? leadNameTextControllerValidator;
  // State field(s) for leadEmail widget.
  FocusNode? leadEmailFocusNode;
  TextEditingController? leadEmailTextController;
  String? Function(BuildContext, String?)? leadEmailTextControllerValidator;
  // State field(s) for leadPhone widget.
  FocusNode? leadPhoneFocusNode;
  TextEditingController? leadPhoneTextController;
  final leadPhoneMask = MaskTextInputFormatter(mask: '(###) ###-####');
  String? Function(BuildContext, String?)? leadPhoneTextControllerValidator;
  // State field(s) for language widget.
  String? languageValue;
  FormFieldController<String>? languageValueController;
  // State field(s) for areaOfInterest widget.
  List<String>? areaOfInterestValue;
  FormFieldController<List<String>>? areaOfInterestValueController;
  // State field(s) for prequalOrPending widget.
  String? prequalOrPendingValue;
  FormFieldController<String>? prequalOrPendingValueController;
  // State field(s) for prequalAmt widget.
  String? prequalAmtValue;
  FormFieldController<String>? prequalAmtValueController;
  // State field(s) for homeToSellLender widget.
  FormFieldController<List<String>>? homeToSellLenderValueController;
  String? get homeToSellLenderValue =>
      homeToSellLenderValueController?.value?.firstOrNull;
  set homeToSellLenderValue(String? val) =>
      homeToSellLenderValueController?.value = val != null ? [val] : [];
  // State field(s) for highNurtureLead widget.
  FormFieldController<List<String>>? highNurtureLeadValueController;
  String? get highNurtureLeadValue =>
      highNurtureLeadValueController?.value?.firstOrNull;
  set highNurtureLeadValue(String? val) =>
      highNurtureLeadValueController?.value = val != null ? [val] : [];
  // State field(s) for workingwithRealtor widget.
  FormFieldController<List<String>>? workingwithRealtorValueController;
  String? get workingwithRealtorValue =>
      workingwithRealtorValueController?.value?.firstOrNull;
  set workingwithRealtorValue(String? val) =>
      workingwithRealtorValueController?.value = val != null ? [val] : [];
  // State field(s) for loanPurpose widget.
  String? loanPurposeValue;
  FormFieldController<String>? loanPurposeValueController;
  // State field(s) for prequalAmtRealtor widget.
  String? prequalAmtRealtorValue;
  FormFieldController<String>? prequalAmtRealtorValueController;
  // State field(s) for hometoSellRealtor widget.
  FormFieldController<List<String>>? hometoSellRealtorValueController;
  String? get hometoSellRealtorValue =>
      hometoSellRealtorValueController?.value?.firstOrNull;
  set hometoSellRealtorValue(String? val) =>
      hometoSellRealtorValueController?.value = val != null ? [val] : [];
  // State field(s) for readytoApplyforMortgage widget.
  FormFieldController<List<String>>? readytoApplyforMortgageValueController;
  String? get readytoApplyforMortgageValue =>
      readytoApplyforMortgageValueController?.value?.firstOrNull;
  set readytoApplyforMortgageValue(String? val) =>
      readytoApplyforMortgageValueController?.value = val != null ? [val] : [];
  // State field(s) for workingwithLender widget.
  FormFieldController<List<String>>? workingwithLenderValueController;
  String? get workingwithLenderValue =>
      workingwithLenderValueController?.value?.firstOrNull;
  set workingwithLenderValue(String? val) =>
      workingwithLenderValueController?.value = val != null ? [val] : [];
  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  // State field(s) for chooseRecipient widget.
  String? chooseRecipientValue;
  FormFieldController<String>? chooseRecipientValueController;

  String? selectedPodNumber;
  FormFieldController<String>? selectedPodNumberController;

  @override
  void initState(BuildContext context) {
    webNavModel = createModel(context, () => WebNavModel());
  }

  @override
  void dispose() {
    webNavModel.dispose();
    leadNameFocusNode?.dispose();
    leadNameTextController?.dispose();

    leadEmailFocusNode?.dispose();
    leadEmailTextController?.dispose();

    leadPhoneFocusNode?.dispose();
    leadPhoneTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();
  }
}
