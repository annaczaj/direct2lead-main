import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/modals/edit_profile_photo_user/edit_profile_photo_user_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'modal_profile_edit_model.dart';
export 'modal_profile_edit_model.dart';

class ModalProfileEditWidget extends StatefulWidget {
  const ModalProfileEditWidget({super.key});

  @override
  State<ModalProfileEditWidget> createState() => _ModalProfileEditWidgetState();
}

class _ModalProfileEditWidgetState extends State<ModalProfileEditWidget>
    with TickerProviderStateMixin {
  late ModalProfileEditModel _model;

  final animationsMap = <String, AnimationInfo>{};

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ModalProfileEditModel());

    _model.yourNameTextController ??=
        TextEditingController(text: currentUserDisplayName);
    _model.yourNameFocusNode ??= FocusNode();

    _model.yourBrokerageTextController ??= TextEditingController(
        text: valueOrDefault(currentUserDocument?.bio, ''));
    _model.yourBrokerageFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          MoveEffect(
            curve: Curves.bounceOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 16.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 670.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: Color(0x1E000000),
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'qs8serr4' /* Edit Profile */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'bvy3fs93' /* Below are your profile details */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).accent1,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: AuthUserStreamWidget(
                                  builder: (context) => Container(
                                    width: 90.0,
                                    height: 90.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      fadeInDuration:
                                          const Duration(milliseconds: 500),
                                      fadeOutDuration:
                                          const Duration(milliseconds: 500),
                                      imageUrl: currentUserPhoto,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'MODAL_PROFILE_EDIT_CHANGE_PHOTO_BTN_ON_T');
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: const EditProfilePhotoUserWidget(),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              text: FFLocalizations.of(context).getText(
                                'nx89dnuw' /* Change Photo */,
                              ),
                              options: FFButtonOptions(
                                height: 44.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      letterSpacing: 0.0,
                                    ),
                                elevation: 0.0,
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                                hoverColor:
                                    FlutterFlowTheme.of(context).alternate,
                                hoverBorderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                hoverTextColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                hoverElevation: 3.0,
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            controller: _model.yourNameTextController,
                            focusNode: _model.yourNameFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '99oumm34' /* Name */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  letterSpacing: 0.0,
                                ),
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.yourNameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 16.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => TextFormField(
                            controller: _model.yourBrokerageTextController,
                            focusNode: _model.yourBrokerageFocusNode,
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                '8gkrs3rw' /* Short Description */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 20.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Plus Jakarta Sans',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 4,
                            minLines: 3,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model
                                .yourBrokerageTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: SelectionArea(
                                        child: Text(
                                      FFLocalizations.of(context).getText(
                                        'p1lquhce' /* The email associated with this... */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 0.0),
                                    child: SelectionArea(
                                        child: Text(
                                      currentUserEmail,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: SelectionArea(
                                        child: Text(
                                      FFLocalizations.of(context).getText(
                                        'fyuvtufe' /* Created On: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => SelectionArea(
                                          child: Text(
                                        dateTimeFormat(
                                          "yMMMd",
                                          currentUserDocument!.createdTime!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 0.0, 0.0),
                                    child: SelectionArea(
                                        child: Text(
                                      FFLocalizations.of(context).getText(
                                        'h4jwedag' /* Last Active: */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            letterSpacing: 0.0,
                                          ),
                                    )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => SelectionArea(
                                          child: Text(
                                        dateTimeFormat(
                                          "relative",
                                          currentUserDocument!.lastActive!,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              letterSpacing: 0.0,
                                            ),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 24.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.05),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MODAL_PROFILE_EDIT_CANCEL_BTN_ON_TAP');
                              Navigator.pop(context);
                            },
                            text: FFLocalizations.of(context).getText(
                              '27w5o6gn' /* Cancel */,
                            ),
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              hoverColor:
                                  FlutterFlowTheme.of(context).alternate,
                              hoverBorderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              hoverTextColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              hoverElevation: 3.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.05),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'MODAL_PROFILE_EDIT_SAVE_CHANGES_BTN_ON_T');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                displayName: _model.yourNameTextController.text,
                                bio: _model.yourBrokerageTextController.text,
                              ));
                              context.pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'You successfully updated your profile information!',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).secondary,
                                ),
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'gz2xhplu' /* Save Changes */,
                            ),
                            options: FFButtonOptions(
                              height: 44.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                              hoverColor: FlutterFlowTheme.of(context).accent1,
                              hoverBorderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 1.0,
                              ),
                              hoverTextColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              hoverElevation: 0.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          ),
        ],
      ),
    );
  }
}