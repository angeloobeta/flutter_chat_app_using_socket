import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app_using_socket/model/models/messageModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/constants/strings.dart';
import 'package:uuid/uuid.dart';

class BaseModel extends ChangeNotifier {
  // Uuid uuid = Uuid();
  // final String userId = uuid.v1().toString();
  //
  // List<MessageModel>? listOfMessage = [
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "Beta",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "Tangelo",
  //       from: "Cypher",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: false,
  //       toUserOnlineStatus: true),
  //   MessageModel(
  //       chatId: 01,
  //       to: "BetaByte",
  //       from: "B",
  //       message: "This is my message",
  //       chatType: "single",
  //       isFromMe: true,
  //       toUserOnlineStatus: true),
  // ];

  var userID = const Uuid();

  List<MessageModel>? listOfMessage = [];

  // controller
  TextEditingController textEditingController = TextEditingController();

  //
  //
  String? input;
  //
  final formKey = GlobalKey<FormState>();

  // validate
  onValidate(context, String? value) {
    value = textEditingController.text;
    notifyListeners();
    if (value.length == 1 || value.length <= 4) {
      developer.log('Button was pressed', time: DateTime.now());
      return "Your name is too short";
    }
    if (value.trim().isEmpty == true) {
      return "Enter a value";
    } else {
      return;
    }
  }

  //
  onPressEnter(context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, chatPage);
    }
  }
}
