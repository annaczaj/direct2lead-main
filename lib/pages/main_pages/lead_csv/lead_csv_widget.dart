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

                                const leads = [];

                                if (result != null) {
                                  Uint8List fileBytes =
                                      result.files.first.bytes!;
                                  String csvString = utf8.decode(fileBytes);

                                  List<List<dynamic>> rows =
                                      const CsvToListConverter()
                                          .convert(csvString);

                                  print('CSV Rows: $rows');

                                  for (var row in rows.skip(1)) {
                                    Map<String, dynamic> leadData = {
                                      'leadName': row[0],
                                      'leadEmail': row[1],
                                      'leadRecipient': row[3],
                                      'leadSender': currentUserUid,
                                      'leadPhone': row[4],
                                      'language': row[5],
                                      'leadStage': 'Sent',
                                      'prequalOrPending': row[6],
                                      'senderInfo': currentUserDocument,
                                      'numComments': 0,
                                      'homeToSellLender': row[9],
                                      'prequalAmtLender': row[10],
                                      'highNurture': row[11],
                                      'workingWithRealtor': row[12],
                                      'senderUserType':
                                          currentUserDocument?.userType,
                                      'senderGroupID':
                                          currentUserDocument?.groupID,
                                    };

                                    await LeadInfoRecord.collection.doc().set({
                                      ...createLeadInfoRecordData(
                                          leadName: leadData['leadName'],
                                          leadEmail: leadData['leadEmail'],
                                          leadRecipient:
                                              leadData['leadRecipient'],
                                          leadSender: leadData['leadSender'],
                                          leadPhone: leadData['leadPhone'],
                                          language: leadData['language'],
                                          leadStage: leadData['leadStage'],
                                          prequalOrPending:
                                              leadData['prequalOrPending'],
                                          senderInfo: leadData['senderInfo'],
                                          numComments: leadData['numComments'],
                                          homeToSellLender:
                                              leadData['homeToSellLender'],
                                          prequalAmtLender:
                                              leadData['prequalAmtLender'],
                                          highNurture: leadData['highNurture'],
                                          workingWithRealtor:
                                              leadData['workingWithRealtor'],
                                          senderUserType:
                                              leadData['senderUserType'],
                                          senderGroupID:
                                              leadData['senderGroupID']),
                                      ...mapToFirestore({
                                        'leadCreationDate':
                                            FieldValue.serverTimestamp(),
                                      })
                                    });
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
