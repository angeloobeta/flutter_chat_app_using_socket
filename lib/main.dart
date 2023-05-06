import 'package:flutter/material.dart';
import 'package:flutter_chat_app_using_socket/views/pages/socketClient/loginScreen.dart';

import 'Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routes(),
      initialRoute: Routes.initScreen(),
      home: const LoginScreen(),
    );
  }
}
