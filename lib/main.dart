import 'package:flutter/material.dart';

import 'part 1 (adhara-package)/Routes.dart';

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
