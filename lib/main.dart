import 'dart:io';

import 'package:design_redo_direct2_lead/backend/schema/users_record.dart';
import 'package:design_redo_direct2_lead/components/notification_badge.dart';
import 'package:design_redo_direct2_lead/pages/main_pages/lead_csv/lead_csv_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:overlay_support/overlay_support.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'index.dart';
import 'components/push_notification.dart';

import 'package:firebase_core/firebase_core.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await initFirebase();

  await FlutterFlowTheme.initialize();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});

  late int _totalNotifications;
  late final FirebaseMessaging _messaging;
  PushNotification? _notification_info;

  void requestAndRegisterNotification() async {
    await Firebase.initializeApp();

    _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    NotificationSettings settings = await _messaging.requestPermission(
        alert: true, badge: true, provisional: false, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      String? _token = await _messaging.getToken();
      print('The token is ' + _token!);
      currentUserReference!.update(createUsersRecordData(token: _token));
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );
        setState(() {
          _notification_info = notification;
          _totalNotifications++;
        });

        if (_notification_info != null) {
          showSimpleNotification(
            Text(_notification_info!.title!),
            leading: NotificationBadge(totalNotifications: _totalNotifications),
            subtitle: Text(_notification_info!.body!),
            background: FlutterFlowTheme.of(context).background,
            duration: Duration(seconds: 2),
          );
        }
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  void initState() {
    if (isiOS) {
      requestAndRegisterNotification();
    }
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );
      setState(() {
        _notification_info = notification;
        _totalNotifications++;
      });
    });
    _totalNotifications = 0;

    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = designRedoDirect2LeadFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'DesignRedoDirect2Lead',
      localizationsDelegates: const [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('en'),
        Locale('bn'),
        Locale('ta'),
        Locale('te'),
        Locale('or'),
        Locale('ml'),
        Locale('hi'),
        Locale('ur'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key, this.initialPage, this.page});

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Main_Home';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Main_Home': const MainHomeWidget(),
      'Main_customerList': const MainCustomerListWidget(),
      'Main_profilePage': const MainProfilePageWidget(),
      'Main_Contracts': const MainContractsWidget(),
      'Main_messages': const MainMessagesWidget(),
      'Main_HomeAdmin': const MainHomeAdminWidget(),
      'Main_HomeSuperAdmin': const MainHomeSuperAdminWidget(),
      'Lead_Csv': const LeadCsvWidget()
    };
    final currentIndex = (_currentPageName == 'Main_Home' ||
            _currentPageName == 'Main_customerList' ||
            _currentPageName == 'Main_profilePage' ||
            _currentPageName == 'Main_Contracts')
        ? tabs.keys.toList().indexOf(_currentPageName)
        : 0;

    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          tabletLandscape: false,
          desktop: false,
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => safeSetState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          selectedItemColor: FlutterFlowTheme.of(context).primary,
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.dashboard_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.dashboard_rounded,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'xdxbdj20' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.supervised_user_circle_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.supervised_user_circle_sharp,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                '3ourv2w9' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.verified_user_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.verified_user_sharp,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'xdxbdj20' /* __ */,
              ),
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.add_chart_outlined,
                size: 24.0,
              ),
              activeIcon: const Icon(
                Icons.add_chart_sharp,
                size: 32.0,
              ),
              label: FFLocalizations.of(context).getText(
                'xdxbdj20' /* __ */,
              ),
              tooltip: '',
            ),
          ],
        ),
      ),
    );
  }
}
