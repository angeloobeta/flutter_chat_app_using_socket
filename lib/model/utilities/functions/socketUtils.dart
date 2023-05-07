import 'dart:developer' as developer;
import 'dart:io';

import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';

class SocketUtils {
  //
  static String serverIP =
      Platform.isMacOS ? "http://localhost" : "http://10.0.2.2";
  static const int portNo = 6000;

  static String connectionUrl = "$serverIP:$portNo";

  // Event
  static const String ON_Message_Received = "receive_message";
  static const String IS_User_Online_Event = "check_online";

  // Status
  static const int Status_Message_Not_Sent = 10001;
  static const int Status_Message_Sent = 10002;

  // Type of chat
  static const String Single_Chat = "single_chat";

  //
  UserModel? userModel;

  SocketIO? socketIO;
  SocketIOManager socketManager = SocketIOManager();

  //

  initSocket(UserModel userModel) async {
    this.userModel = userModel;
    developer.log("connecting ... ${userModel.name}");
    await init();
  }

  // initiate socket connection
  init() async {
    socketIO = await socketManager.createInstance(socketOption());
  }

  connectToSocket() {
    if (null == socketIO) {
      developer.log("Socket is null");
      return;
    }
    socketIO!.connect();
  }

  //
  socketOption() {
    final Map<String, String> userMap = {'from': userModel!.id.toString()};

    return SocketOptions(connectionUrl,
        enableLogging: true,
        transports: [Transports.webSocket],
        query: userMap);
  }

  // check if the connection is successful
  setConnectionListener(Function onConnect) {
    if (socketIO!.onConnect != null) {
      (data) {
        onConnect(data);
      };
    }
    ;
  }

  // check if there is error
  setConnectionTimedOutListener(Function onConnectionTimeout) {
    if (socketIO!.onConnectTimeout != null) {
      ((data) {
        onConnectionTimeout(data);
      });
    }
    ;
  }

  //
  setConnectionErrorListener(Function onConnectionError) {
    if (socketIO!.onConnectError != null) {
      ((data) {
        onConnectionError(data);
      });
    }
  }

//
  setOnErrorListener(Function onError) {
    if (socketIO!.onError != null) {
      ((data) {
        onError(data);
      });
    }
  }

//
  setOnDisconnectListener(Function onDisconnectListener) {
    if (socketIO!.onDisconnect != null) {
      ((data) {
        onDisconnectListener(data);
      });
    }
  }

  //
  closeConnection() {
    if (socketIO != null) {
      developer.log("Closing connection");
      socketManager.clearInstance(socketIO);
    }
  }
}
