import 'package:flutter_chat_app_using_socket/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class UserChatViewModel extends BaseModel {
  List<UserModel>? chatUsers = G.getUsersFor(G.loggedInUser!);

  // initial
  onChatScreen(context) {
    chatUsers = G.getUsersFor(G.loggedInUser!);
    notifyListeners();
  }
}
