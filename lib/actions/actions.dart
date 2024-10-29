import '/backend/backend.dart';
import '/components/modal_sections/modal_user/modal_user_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future openUserDetails(
  BuildContext context, {
  LeadInfoRecord? leadDoc,
}) async {
  if (MediaQuery.sizeOf(context).width <= 991.0) {
    context.pushNamed(
      'userDetails',
      queryParameters: {
        'showBack': serializeParam(
          true,
          ParamType.bool,
        ),
        'leadInfo': serializeParam(
          leadDoc,
          ParamType.Document,
        ),
      }.withoutNulls,
      extra: <String, dynamic>{
        'leadInfo': leadDoc,
      },
    );
  } else {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return Padding(
          padding: MediaQuery.viewInsetsOf(context),
          child: ModalUserWidget(
            leadDoc: leadDoc!,
          ),
        );
      },
    );
  }
}
