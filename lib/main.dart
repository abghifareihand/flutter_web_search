import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:wifipos_web/presentation/pages/download_page.dart';
import 'package:wifipos_web/presentation/pages/history_tracking_page.dart';
import 'package:wifipos_web/presentation/pages/home_page.dart';
import 'package:wifipos_web/presentation/pages/kontak_page.dart';
import 'package:wifipos_web/presentation/pages/search_page.dart';
import 'package:wifipos_web/presentation/pages/search_tracking_page.dart';
import 'package:wifipos_web/presentation/pages/splash_page.dart';
import 'package:wifipos_web/presentation/pages/tentang_page.dart';
import 'presentation/bloc/tracking_bloc/tracking_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'presentation/pages/landing_page.dart';
import 'presentation/pages/login_page.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => TrackingBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashPage(),
          '/': (context) => const LandingPage(),
          '/all-tracking': (context) => const SearchPage(),
          '/login': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/download': (context) => const DownloadPage(),
          '/kontak': (context) => const KontakPage(),
          '/tentang': (context) => const TentangPage(),
          '/tracking': (context) => const SearchTrackingPage(),
          '/history': (context) => const HistoryTrackingPage(),
        },
      ),
    );
  }
}
