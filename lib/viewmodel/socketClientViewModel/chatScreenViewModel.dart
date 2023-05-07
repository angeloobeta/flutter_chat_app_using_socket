import 'package:flutter_chat_app_using_socket/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/models/chatMessageModel.dart';
import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class ChatScreenViewModel extends BaseModel {
  TextEditingController chatEditingController = TextEditingController();
  List<UserModel>? chatUsers = G.getUsersFor(G.loggedInUser!);

  List<ChatMessageModel>? chatMessageModel;
  // initial
  onChatScreen(context) {
    chatUsers = G.getUsersFor(G.loggedInUser!);
    notifyListeners();
  }
}
