import 'package:flutter_chat_app_using_socket/model/utilities/functions/socketClient.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/baseModel.dart';

class ChatViewModel extends BaseModel {
  SocketClient socketClient = SocketClient();

//connect socket server
  onConnectSocket(context) {
    socketClient.initialiseSocket();
  }
  //
}
