import 'dart:developer' as developer;

import 'package:flutter_chat_app_using_socket/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class UserChatViewModel extends BaseModel {
  //? Text editing controller
  TextEditingController chatEditingController = TextEditingController();
  List<UserModel>? chatUsers = G.getUsersFor(G.loggedInUser!);
//
  bool? connectedToSocket;
  String? connectMessage;

  // initial
  onChatScreen(context) {
    chatUsers = G.getUsersFor(G.loggedInUser!);
    connectedToSocket = false;
    connectMessage = "Connecting ....";
    notifyListeners();
  }

  //
  onConnectToSocket() {
    G.initSocket();
    developer.log(
        "Connecting login user ${G.loggedInUser!.name}  ${G.loggedInUser!.id}");
    G.socketUtils!.initSocket(G.loggedInUser!);
    G.socketUtils!.connectToSocket();
  }
}
