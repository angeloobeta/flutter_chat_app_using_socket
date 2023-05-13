import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app_using_socket/model/models/messageModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/functions/socketClient.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/baseModel.dart';

class ChatViewModel extends BaseModel {
  //
  TextEditingController payloadEditingController = TextEditingController();
  SocketClient socketClient = SocketClient();

  MessageModel? messageModel;

//connect socket server
  onConnectSocket(context) {
    socketClient.initSocket();
    socketClient.onConnectSocket();
  }

  // disconnect socket server
  onDisconnectSocket(context) {
    socketClient.disconnectSocket();
  }

  onSendMessage(context) {
    listOfMessage!.add(MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "Beta",
        message: payloadEditingController.text,
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true));
    notifyListeners();
    if (payloadEditingController.text.isNotEmpty) {
      developer.log(
          "we are sending  ${payloadEditingController.text}  as data to backend");
      socketClient.sendDataTo(payloadEditingController.text);
      payloadEditingController.clear();
    } else {
      developer.log("We aren't sending any data");
      developer.log(payloadEditingController.text);
      socketClient.sendDataTo("We aren't sending anything biko");
    }
  }
}
