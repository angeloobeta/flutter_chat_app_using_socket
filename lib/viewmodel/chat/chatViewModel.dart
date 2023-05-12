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
  List<MessageModel>? listOfMessage = [
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "Beta",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "Tangelo",
        from: "Cypher",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: false,
        toUserOnlineStatus: true),
    MessageModel(
        chatId: 01,
        to: "BetaByte",
        from: "B",
        message: "This is my message",
        chatType: "single",
        isFromMe: true,
        toUserOnlineStatus: true),
  ];

//connect socket server
  onConnectSocket(context) {
    socketClient.initSocket();
    socketClient.onConnectSocket();
  }

  // disconnect socket server
  onDisconnectSocket(context) {
    socketClient.disconnectSocket();
  }

  onSendMessage(context, String senderName) {
    messageModel = MessageModel();
  }

  onSendData(context) {
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
