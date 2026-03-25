import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:get/get.dart';

import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/nav/nav.dart';
import 'app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  await Firebase.initializeApp();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class MyAppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class _MyAppState extends State<MyApp> with GetxStatefulStateMixin {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late Stream<BaseAuthUser> userStream;

  // Local splash flag to avoid getting stuck on global auth loading.
  bool _showSplash = true;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    userStream = theOwensboroAppFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});

    // Warm categories in the background — do not await before leaving splash or
    // a slow/hanging Firestore call can leave [initialRoute] stuck forever.
    unawaited(_warmCategoriesCache());
    _dismissSplashAfterFirstFrame();
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  /// Hides splash on the next frame so we never call [safeSetState] during
  /// [build] (avoids setState/markNeedsBuild errors with [Get.forceAppUpdate]).
  void _dismissSplashAfterFirstFrame() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      safeSetState(() {
        _showSplash = false;
      });
    });
  }

  /// Best-effort Firestore warm-up; home screen still loads its own data if needed.
  Future<void> _warmCategoriesCache() async {
    try {
      await queryCatagoriesRecord(
        queryBuilder: (catagoriesRecord) => catagoriesRecord.orderBy('order'),
      ).first.timeout(const Duration(seconds: 15));
    } catch (_) {
      // Ignore — network/offline/timeouts should not block the app shell.
    }
  }

  String getRoute() => Get.currentRoute;

  List<String> getRouteStack() => [Get.currentRoute];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Owensboro App',
      scrollBehavior: MyAppScrollBehavior(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      initialRoute: AppRoutes.initial,
      getPages: AppPages.pages,
      builder: (context, child) {
        if (_showSplash) {
          return Container(
            color: FlutterFlowTheme.of(context).primaryBackground,
            child: Center(
              child: Image.asset(
                'assets/images/New_TOA_Logo.png',
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        }
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
