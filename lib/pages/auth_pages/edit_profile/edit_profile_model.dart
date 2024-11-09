import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for yourBrokerage widget.
  FocusNode? yourBrokerageFocusNode;
  TextEditingController? yourBrokerageTextController;
  String? Function(BuildContext, String?)? yourBrokerageTextControllerValidator;
  // State field(s) for languages widget.
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
