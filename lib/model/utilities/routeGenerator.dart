import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/views/pages/chatPage/chatPage.dart';
import 'package:flutter_chat_app_using_socket/views/pages/groupPage/groupChat.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    switch (settings.name) {
      // chatHomePage pages

      // groupChat page
      case groupChatPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const GroupChat(),
        );

      // chatMessage page
      case chatPage:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChatPage(),
        );

      //chatM
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
