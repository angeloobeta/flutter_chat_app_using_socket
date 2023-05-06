class ChatMessageModel {
  int? chatId;
  String? to;
  String? from;
  String? chatType;
  String? toUserOnlineStatus;

  ChatMessageModel(
      {this.chatId,
      this.to,
      this.from,
      this.chatType,
      this.toUserOnlineStatus});

  factory ChatMessageModel.formMap(Map<String, dynamic> map) {
    return ChatMessageModel(
        chatId: map["chatId"] as int,
        to: map["to"] as String,
        from: map["from"] as String,
        chatType: ["chatType"] as String,
        toUserOnlineStatus: ["toUserOnlineStatus"] as String);
  }

  Map<String, dynamic> toMap() => {
        "chatId": chatId,
        "to": to,
        "from": from,
        "chatType": chatType,
        "toUserOnlineStatus": toUserOnlineStatus
      };
}
