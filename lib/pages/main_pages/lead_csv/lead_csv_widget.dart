import 'package:design_redo_direct2_lead/backend/firebase_analytics/analytics.dart';
import 'package:design_redo_direct2_lead/flutter_flow/flutter_flow_model.dart';
import 'package:design_redo_direct2_lead/flutter_flow/flutter_flow_theme.dart';
import 'package:design_redo_direct2_lead/flutter_flow/flutter_flow_util.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import 'package:flutter/material.dart';
import 'lead_csv_model.dart';
export 'lead_csv_model.dart';

class LeadCsvWidget extends StatefulWidget {
  const LeadCsvWidget({super.key});

  @override
  State<LeadCsvWidget> createState() => _LeadCsvWidgetState();
}

class _LeadCsvWidgetState extends State<LeadCsvWidget> {
  late LeadCSVModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadCSVModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'csvEntry'});
    _model.textController ??= TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: null,
        body: Column());
  }
}
