import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn1/screens/app_detail_screen/app_detail_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn1/screens/apps_screen/apps_screen.dart';
import 'package:learn1/screens/settings_screen/settings_screen.dart';
import 'package:learn1/screens/version_history_screen/version_history_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

import 'data/data_source/remote/api.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();

    var prefs = await SharedPreferences.getInstance();
    prefs.setString('languageCode', newLocale.languageCode);
    prefs.setString('countryCode', "");

    state?.setState(() {
      state._locale = newLocale;
    });
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Locale _locale = const Locale('en', '');

  @override
  void initState() {
    super.initState();
    _fetchLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
  }

  Future<Locale> _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    String languageCode = prefs.getString('languageCode') ?? 'en';

    return Locale(languageCode);
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: AppDetailsScreen.getRouteName(),
        builder: (BuildContext context, GoRouterState state) {
          final appId = state.params['appId']!;
          return AppDetailsScreen(
            appId: appId,
          );
        },
      ),
      GoRoute(
        path: SettingsScreen.getRouteName(),
        builder: (BuildContext context, GoRouterState state) {
          final appName = state.params['appname']!;
          return SettingsScreen(
            appName: appName,
          );
        },
      ),
      GoRoute(
        path: VersionHistoryScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return VersionHistoryScreen();
        },
      ),
      GoRoute(
        path: AppsScreen.routeName,
        builder: (BuildContext context, GoRouterState state) {
          return const AppsScreen();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => AppApi())],
      child: MaterialApp.router(
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        locale: _locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          Locale('ar', '')
        ],

        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const AppDetailsScreen(),
      ),
    );
  }
}
