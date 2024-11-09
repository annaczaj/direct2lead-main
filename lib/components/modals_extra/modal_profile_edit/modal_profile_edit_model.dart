import '/flutter_flow/flutter_flow_util.dart';
import 'modal_profile_edit_widget.dart' show ModalProfileEditWidget;
import 'package:flutter/material.dart';

class ModalProfileEditModel extends FlutterFlowModel<ModalProfileEditWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for yourBrokerage widget.
  FocusNode? yourBrokerageFocusNode;
  TextEditingController? yourBrokerageTextController;
  String? Function(BuildContext, String?)? yourBrokerageTextControllerValidator;

  List<String> selectedLanguages = [];
  // State field(s) for workAreas widget.
  List<String> selectedWorkAreas = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    yourBrokerageFocusNode?.dispose();
    yourBrokerageTextController?.dispose();
  }
}
