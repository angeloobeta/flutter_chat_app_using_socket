class ChatMessageModel {
  int? chatId;
  String? to;
  String? message;
  String? from;
  String? chatType;
  bool? toUserOnlineStatus;

  ChatMessageModel(
      {this.chatId,
      this.to,
      this.message,
      this.from,
      this.chatType,
      this.toUserOnlineStatus});

  factory ChatMessageModel.fromMap(Map<String, dynamic> map) {
    return ChatMessageModel(
        chatId: map["chatId"] as int,
        to: map["to"] as String,
        message: map["message"] as String,
        from: map["from"] as String,
        chatType: ["chatType"] as String,
        toUserOnlineStatus: ["toUserOnlineStatus"] as bool);
  }

  Map<String, dynamic> toMap() => {
        "chatId": chatId,
        "to": to,
        "from": from,
        "message": message,
        "chatType": chatType,
        "toUserOnlineStatus": toUserOnlineStatus
      };
}
