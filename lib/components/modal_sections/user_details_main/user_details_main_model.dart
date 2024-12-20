import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_details_main_widget.dart' show UserDetailsMainWidget;
import 'package:flutter/material.dart';

class UserDetailsMainModel extends FlutterFlowModel<UserDetailsMainWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for stageChoice widget.
  FormFieldController<List<String>>? stageChoiceValueController;

  String? stageDropDownValue;
  FormFieldController<String>? stageDropDownValueController;

  String? get stageChoiceValue =>
      stageChoiceValueController?.value?.firstOrNull;
  set stageChoiceValue(String? val) =>
      stageChoiceValueController?.value = val != null ? [val] : [];

  // Ensure initialization of stageChoiceValueController
  void initializeStageChoiceController(String? initialValue) {
    stageChoiceValueController = FormFieldController<List<String>>(
      initialValue != null ? [initialValue] : [],
    );
  }

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
