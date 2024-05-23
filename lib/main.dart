import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:wifipos_web/presentation/pages/splash_page.dart';
import 'presentation/bloc/tracking_bloc/tracking_bloc.dart';

void main() {
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
        home: const SplashPage(),
      ),
    );
  }
}
