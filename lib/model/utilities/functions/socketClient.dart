import 'dart:developer' as developer;
import 'dart:io';

import 'package:flutter_chat_app_using_socket/model/models/messageModel.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/baseModel.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketClient extends BaseModel {
  // ChatViewModel chatViewModel = ChatViewModel();
  Socket? socket;

  // server ip address
  static String serverIP =
      Platform.isIOS ? "http://localhost" : "http://10.0.2.2";

  // socket port
  static const String PORT = ":6000";

  // connection url
  static String connectionUrl = serverIP + PORT;

  Socket initSocket() {
    socket = io(
        connectionUrl,
        OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect() // Use websocket transport
            .setExtraHeaders({
              "Authorization": "Bearer your_access_token_here",
              // Add any extra headers required by your server here
            })
            .build());
    return socket!;
  }

  onConnectSocket() {
    socket = initSocket();
    // Listen for successful connection
    socket!.onConnect((_) {
      developer.log("E  don connect oh aah");
      socket!.emit("backend", "Message: E don enter now oh");
      socket!.on("serverSide", (message) {
        if (message["chatId"] != userID.v1())
          listOfMessage!.add(MessageModel(
              chatType: message["chatType"],
              to: "Beta",
              from: "BetaByte",
              toUserOnlineStatus: true,
              isFromMe: message["isFromMe"],
              message: message));
        notifyListeners();
        developer.log(message.toString());
        developer.log("E be like say backend don reply us:");
      });
    });

    // Listen for connection errors
    socket!.onConnectError((error) {
      developer.log("E  never connect oh : $error");
    });

    // Listen for connection timeouts
    socket!.onConnectTimeout((_) {
      print("Connection timed out");
    });

    // Listen for custom events emitted by the server
    socket!.on("myCustomEvent", (data) {
      print("Received data from server: $data");
    });

    //     // Connecting
    socket!.onConnecting((data) {
      developer.log("E  de try connect ");
    });

    // Connect to the server
    socket!.connect();
  }

  void disconnectSocket() {
    // Disconnect
    socket!.onDisconnect((data) {
      developer.log("E  don disconnect oh ");
    });

    socket!.disconnect();
  }

  void sendDataTo(String payload) {
    socket = initSocket();
    developer.log("Sending data to backend");
    socket!.emit("backend", payload);
  }
}
