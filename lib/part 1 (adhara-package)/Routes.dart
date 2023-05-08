import 'package:flutter_chat_app_using_socket/views/pages/socketClient/chatScreen.dart';
import 'package:flutter_chat_app_using_socket/views/pages/socketClient/loginScreen.dart';
import 'package:flutter_chat_app_using_socket/views/pages/socketClient/userChatScreen.dart';

class Routes {
  static routes() {
    return {
      LoginScreen.ROUTES_ID: (context) => const LoginScreen(),
      UserChatScreen.ROUTES_ID: (context) => const UserChatScreen(),
      ChatScreen.ROUTES_ID: (context) => const ChatScreen()
    };
  }

  static initScreen() {
    return LoginScreen.ROUTES_ID;
  }
}
