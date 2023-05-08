import 'dart:core';
import 'dart:developer' as developer;

import 'package:flutter_chat_app_using_socket/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/models/chatMessageModel.dart';
import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/functions/socketUtils.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class ChatScreenViewModel extends BaseModel {
  TextEditingController chatEditingController = TextEditingController();

  //
  ScrollController? scrollController = ScrollController(initialScrollOffset: 0);

  // controller the scrolling
  onChatScrollController() {
    Timer(const Duration(milliseconds: 100), () {
      if (scrollController!.hasClients) {
        scrollController?.animateTo(scrollController!.position.maxScrollExtent,
            duration: const Duration(milliseconds: 100),
            curve: Curves.decelerate);
      }
    });
  }

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
          isFromMe: true,
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
      isFromMe: true,
      chatType: SocketUtils.Single_Chat,
    );
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
    chatMessageModel = ChatMessageModel.fromMap(data);
    chatMessageModel!.isFromMe = false;
    onProcessMessage(chatMessageModel!);
    onChatScrollController();
    notifyListeners();
  }

  //
  onProcessMessage(data) {
    // add each send message
    chatMessages!.add(data);
  }

  @override
  void removeListener(VoidCallback listener) async {
    G.socketUtils?.setOnMessageReceiveListener(onMessageReceived);
    G.socketUtils?.setOnlineUserStatusListener(onUserStatus);
    checkOnline();
    super.removeListener(listener);
  }
}
