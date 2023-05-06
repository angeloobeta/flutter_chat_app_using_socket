import 'package:flutter_chat_app_using_socket/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/socketClient/userChatScreen.dart';

class BaseModel extends ChangeNotifier {
  // text editing controller
  TextEditingController usernameController = TextEditingController();

  // focus node
  FocusNode usernameFocusNode = FocusNode();

  UserModel me = G.dummyUser[0];

// bool
  bool usernameError = false;

  List<UserModel> chatUsers = G.getUsersFor(G.loggedInUser!);

// onChange username function

  onLogin(context) {
    if (usernameController.text.isEmpty) {
      usernameError = true;
      notifyListeners();
    }
    onOpenUserListScreen(context);

    if (usernameController.text != 'a') {
      me = G.dummyUser[1];
      notifyListeners();
    }
    G.loggedInUser = me;
    notifyListeners();
  }

  onOpenUserListScreen(context) async {
    await Navigator.pushReplacementNamed(context, UserChatScreen.ROUTES_ID);
  }
}
