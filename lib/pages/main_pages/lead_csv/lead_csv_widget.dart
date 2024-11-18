import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:design_redo_direct2_lead/backend/firebase_analytics/analytics.dart';
import 'package:design_redo_direct2_lead/flutter_flow/flutter_flow_model.dart';
import 'package:design_redo_direct2_lead/flutter_flow/flutter_flow_theme.dart';
import 'package:design_redo_direct2_lead/flutter_flow/flutter_flow_util.dart';
import 'package:design_redo_direct2_lead/flutter_flow/flutter_flow_widgets.dart';
import 'package:file_picker/file_picker.dart';

import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import 'package:flutter/material.dart';
import 'lead_csv_model.dart';
export 'lead_csv_model.dart';
import '/components/web_nav/web_nav_widget.dart';

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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: null,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tablet: false,
                  ))
                    wrapWithModel(
                      model: _model.webNavModel,
                      updateCallback: () => safeSetState(() {}),
                      child: const WebNavWidget(
                        selectedNav: 6,
                      ),
                    ),
                  Expanded(
                    flex: 10,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Upload a CSV file',
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent('submitLeadsCSV');

                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles(
                                  withData: true,
                                  type: FileType.custom,
                                  allowedExtensions: ['csv'],
                                );

                                if (result != null) {
                                  Uint8List fileBytes =
                                      result.files.first.bytes!;
                                  String csvString = utf8.decode(fileBytes);

                                  List<List<dynamic>> rows =
                                      const CsvToListConverter()
                                          .convert(csvString);

                                  print('CSV Rows: $rows');

                                  for (var row in rows.skip(1).where((row) {
                                    return row.any((cell) =>
                                        cell != null &&
                                        cell.toString().trim().isNotEmpty &&
                                        cell != '#N/A');
                                  })) {
                                    Map<String, dynamic> leadData = {
                                      'leadCreationDate':
                                          row[0]?.toString().trim() ?? '',
                                      'leadName':
                                          row[1]?.toString().trim() ?? '',
                                      'leadEmail':
                                          row[2]?.toString().trim() ?? '',
                                      'leadPhone':
                                          row[3]?.toString().trim() ?? '',
                                      'leadPhoneType':
                                          row[4]?.toString().trim() ?? '',
                                      'leadAltPhone':
                                          row[5]?.toString().trim() ?? '',
                                      'leadAltPhoneType':
                                          row[6]?.toString().trim() ?? '',
                                      'leadAddressStreet':
                                          row[7]?.toString().trim() ?? '',
                                      'leadAddressCity':
                                          row[8]?.toString().trim() ?? '',
                                      'leadAddressState':
                                          row[9]?.toString().trim() ?? '',
                                      'leadAddressZip':
                                          row[10]?.toString().trim() ?? '',
                                      'leadRecipient':
                                          row[12]?.toString().trim() ?? '',
                                      'leadStage': 'Sent',
                                      'leadSender': currentUserUid,
                                      'senderUserType':
                                          currentUserDocument?.userType,
                                      'senderGroupID':
                                          currentUserDocument?.groupID,
                                      'senderInfo':
                                          currentUserDocument?.reference,
                                      'numComments': 0,
                                    };

                                    try {
                                      await LeadInfoRecord.collection
                                          .doc()
                                          .set(createLeadInfoRecordData(
                                            leadName: leadData['leadName'],
                                            leadEmail: leadData['leadEmail'],
                                            leadRecipient:
                                                leadData['leadRecipient'],
                                            leadSender: leadData['leadSender'],
                                            leadPhone: leadData['leadPhone'],
                                            leadPhoneType:
                                                leadData['leadPhoneType'],
                                            leadAltPhone:
                                                leadData['leadAltPhone'],
                                            leadAltPhoneType:
                                                leadData['leadAltPhoneType'],
                                            leadAddressStreet:
                                                leadData['leadAddressStreet'],
                                            leadAddressCity:
                                                leadData['leadAddressCity'],
                                            leadAddressState:
                                                leadData['leadAddressState'],
                                            leadAddressZip:
                                                leadData['leadAddressZip'],
                                            leadStage: leadData['leadStage'],
                                            senderUserType:
                                                leadData['senderUserType'],
                                            senderGroupID:
                                                leadData['senderGroupID'],
                                            senderInfo: leadData['senderInfo'],
                                            numComments:
                                                leadData['numComments'],
                                          ));
                                    } catch (e) {
                                      print('Error adding lead: $e');
                                    }
                                  }
                                }
                              },
                              text: 'Upload Leads CSV',
                              options: FFButtonOptions(
                                width: 200.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
