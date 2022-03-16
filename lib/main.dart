import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/wapper.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie',
      locale: const Locale('vn'),
      theme: ThemeData(
        fontFamily: 'Source Sans Pro',
      ),
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Wrapper(),
      //   '/home': (context) => Home(),
      //   '/signIn': (context) => SignIn(),
      //   '/detail': (context) => Detail(),
      // },
    );
  }
}
