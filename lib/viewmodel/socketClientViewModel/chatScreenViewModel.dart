import 'dart:core';
import 'dart:developer' as developer;

import 'package:flutter_chat_app_using_socket/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/models/chatMessageModel.dart';
import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/functions/socketUtils.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class ChatScreenViewModel extends BaseModel {
  TextEditingController? chatEditingController = TextEditingController();
  //
  List<UserModel> chatUsers = G.getUsersFor(G.loggedInUser!);

  // ChatMessageModel chatMessageModel = ChatMessageModel();
  List<ChatMessageModel>? chatMessages;

  ChatMessageModel? chatMessageModel;

  //
  UserModel? toChatUsers;

  OnlineStatus? onlineStatus;

  //
  // List<ChatMessageModel>? chatMessageModel;
  // initial
  onChatScreen(context) {
    chatUsers = G.getUsersFor(G.loggedInUser!);
    notifyListeners();
  }

  onSendMessage(context) {
    if (chatEditingController!.text.isNotEmpty) {
      chatMessageModel = ChatMessageModel(
          chatId: 0,
          from: G.loggedInUser?.id.toString(),
          to: toChatUsers!.id.toString(),
          toUserOnlineStatus: false,
          message: chatEditingController!.text,
          chatType: SocketUtils.Single_Chat);
      G.socketUtils?.sendSingleChatMessage(chatMessageModel!);
    }
  }

  //
  initialiseSocketListener() async {
    G.socketUtils?.setOnMessageReceiveListener(onMessageReceived);
    G.socketUtils?.setOnlineUserStatusListener(onUserStatus);
    checkOnline();
  }

  //
  checkOnline() {
    chatMessageModel = ChatMessageModel(
        chatId: 0,
        from: G.loggedInUser?.id.toString(),
        to: toChatUsers!.id.toString(),
        toUserOnlineStatus: false,
        message: '',
        chatType: SocketUtils.Single_Chat);
    G.socketUtils!.checkOnline(chatMessageModel!);
  }

  //
  onUserStatus(data) {
    developer.log("Online User Status" "$data");
    chatMessageModel = ChatMessageModel.fromMap(data);
    onlineStatus = chatMessageModel?.toUserOnlineStatus
        ? OnlineStatus.online
        : OnlineStatus.offline;
    notifyListeners();
  }

  onMessageReceived(data) {
    developer.log("OnChatMessage Received: $data");
    onProcessMessage(ChatMessageModel.fromMap(data));
    notifyListeners();
  }

  //
  onProcessMessage(data) {
    // add each send message
    chatMessages!.add(data);
  }
}
