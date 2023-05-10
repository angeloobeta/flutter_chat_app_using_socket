import 'package:flutter/material.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/constantImport.dart';
import 'package:flutter_chat_app_using_socket/views/pages/chatPage/chatPage.dart';
import 'package:flutter_chat_app_using_socket/views/pages/groupPage/groupChat.dart';

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
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const GroupChat(),
      // home: const ChatPage(
      //   fromTextEditing: '',
      // ),
    );
  }
}
