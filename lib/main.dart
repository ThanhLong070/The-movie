import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie/blocs/auth/auth_bloc.dart';
import 'package:the_movie/blocs/auth/auth_state.dart';
import 'package:the_movie/repository/auth_repo.dart';
import 'package:the_movie/screens/home/main.dart';
import 'package:the_movie/screens/sign_in/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final sessionId = prefs.getString('sessionId');
  runApp(MyApp(sessionId: sessionId));
}

class MyApp extends StatelessWidget {
  MyApp({this.sessionId});
  String? sessionId;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc(LoginInitial(), AuthRepo()))
      ],
      child: MaterialApp(
        title: 'The Movie',
        locale: const Locale('vn'),
        theme: ThemeData(
          fontFamily: 'Source Sans Pro',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: sessionId == null ? '/' : '/home',
        routes: {
          '/': (context) => SignIn(),
          '/home': (context) => Home(),
        },
      ),
    );
  }
}
