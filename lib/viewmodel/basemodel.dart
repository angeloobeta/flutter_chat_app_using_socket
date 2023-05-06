import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/views/pages/socketClient/userChatScreen.dart';

class BaseModel extends ChangeNotifier {
  // text editing controller

  // UserModel me = G.dummyUser[0];

  // List<UserModel> chatUsers = G.getUsersFor(G.loggedInUser!);

// onChange username function

  onOpenUserListScreen(context) async {
    await Navigator.pushReplacementNamed(context, UserChatScreen.ROUTES_ID);
  }
}
