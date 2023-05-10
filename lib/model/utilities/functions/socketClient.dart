// import 'dart:developer' as developer;
// import 'dart:io';
//
// import 'package:socket_io_client/socket_io_client.dart';
//
// class SocketClient {
//   Socket? socket;
//   // server ip address
//   // static String serverIP = "http://localhost";
//   static String serverIP =
//       Platform.isIOS ? "http://localhost" : "http://10.0.2.2";
//
//   // socket port
//   static const String PORT = "3000";
//
//   // connection url
//   static String connectionUrl = serverIP + PORT;
//
//   // initialise socket
//   initialiseSocket() {
//     socket =
//         io(connectionUrl, OptionBuilder().setTransports(['websocket']).build());
//
//     socket!.connect();
//
//     // Connecting
//     socket!.onConnecting((data) {
//       developer.log("E  de try connect ");
//     });
//
//     // Error
//     socket!.onError((data) {
//       developer.log("Error don occur oh ");
//     });
//
//     // Connection Timeout
//     socket!.onConnectTimeout((data) {
//       developer.log("E  don time out oh ");
//     });
//
//     // Connect
//     socket!.onConnect((socket_) {
//       developer.log("E  don connect oh ");
//       // socket!.emit('message', "test ");
//     });
//
//     // ConnectionError
//     socket!.onConnectError((socket_) {
//       developer.log("E  never connect oh ");
//       // socket!.emit('message', "test ");
//     });
//
//     // Disconnect
//     socket!.onDisconnect((data) {
//       developer.log("E  don disconnect oh ");
//     });
//   }
// }
//
// // class SocketClient {
// //   static final SocketClient instance = SocketClient._init();
// //   static Socket? _socket;
// //   SocketClient._init();
// //
// //   Socket get socket {
// //     if (_socket != null) return _socket!;
// //     _socket = io("http://localhost:6000",
// //         OptionBuilder().setTransports(['websocket']).build());
// //     return _socket!;
// //   }
// //
// //   // void connectAndListen() async {
// //   //   String senderDeviceId = (await PlatformDeviceId.getDeviceId)!;
// //   //   developer.log("Woooow Websocket don connect oh");
// //   //
// //   //   socket.auth = {'senderDeviceId': senderDeviceId};
// //   //   socket.onConnect((data) {
// //   //     developer.log("Woooow Websocket don connect oh");
// //   //     debugPrint(socket.id);
// //   //     // GlobalVariable.socketId = socket.id;
// //   //   });
// //   //   socket.onError((data) => debugPrint('Error => $data'));
// //   //   socket.onDisconnect((data) => debugPrint('Disconnected'));
// //   //   // socket.on('message', (data) async => await receiveMessage(data, ref));
// //   //   // socket.on('request', (data) async => await sendRequest(data, ref));
// //   //   // socket.on('accept', (data) async => await sendAcceptedRequest(data, ref));
// //   // }
// //
// //   // void sendMessage(MessageModel message) {
// //   //   socket.emit(
// //   //     'message',
// //   //     message.toMap(),
// //   //   );
// //   // }
// //
// //   // Future<bool> receiveMessage(dynamic data, WidgetRef ref) async {
// //   //   MessageModel messageModel = MessageModel.fromMap(data);
// //   //   messageModel.type = 'recieve';
// //   //   await LocalChatHistory.instance.updateLocal(message: messageModel);
// //   //   await ref.read(messageProvider.notifier).getMessages(messageModel);
// //   //   await ref.read(lastMessageProvider.notifier).getLastMessage();
// //   //   return true;
// //   // }
// //
// //   // Future<bool> sendRequest(dynamic data, WidgetRef ref) async {
// //   //   String senderDeviceId = data['senderDeviceId'];
// //   //   String messageId = data['messageId'];
// //   //   String senderSocketId = data['senderSocketId'];
// //   //   String recipientDeviceId = (await PlatformDeviceId.getDeviceId)!;
// //   //   final conversationId = [senderDeviceId, recipientDeviceId];
// //   //   final sortConversationId = conversationId.toList();
// //   //   sortConversationId.sort();
// //   //   final message = MessageModel(
// //   //     dateTime: DateTime.now(),
// //   //     message: 'Accept Request?',
// //   //     messageId: messageId,
// //   //     isRequest: true,
// //   //     type: 'recieve',
// //   //     conversationId: conversationId.join('-'),
// //   //     sortConversationId: sortConversationId.join('-'),
// //   //     senderName: 'User $senderDeviceId',
// //   //     senderSocketId: senderSocketId,
// //   //     senderDeviceId: senderDeviceId,
// //   //     recipientName: 'User $recipientDeviceId',
// //   //     recipientDeviceId: recipientDeviceId,
// //   //     // recipientSocketId: senderSocketId, //to do
// //   //   );
// //   //   await ref.read(lastMessageProvider.notifier).showRequest(message);
// //   //   return true;
// //   // }
// //
// //   // Future<bool> sendAcceptedRequest(dynamic data, WidgetRef ref) async {
// //   //   String senderDeviceId = data['senderDeviceId'];
// //   //   String messageId = data['messageId'];
// //   //   String? senderName = data['senderName'];
// //   //   String senderSocketId = data['senderSocketId'];
// //   //   String recipientDeviceId = (await PlatformDeviceId.getDeviceId)!;
// //   //   final conversationId = [senderDeviceId, recipientDeviceId];
// //   //   final sortConversationId = conversationId.toList();
// //   //   sortConversationId.sort();
// //   //   final message = MessageModel(
// //   //     dateTime: DateTime.now(),
// //   //     message: 'Request Accepted!',
// //   //     conversationId: conversationId.join('-'),
// //   //     messageId: messageId,
// //   //     type: 'recieve',
// //   //     sortConversationId: sortConversationId.join('-'),
// //   //     senderName: 'User $recipientDeviceId',
// //   //     senderSocketId: GlobalVariable.socketId,
// //   //     senderDeviceId: recipientDeviceId,
// //   //     recipientName: senderName,
// //   //     recipientDeviceId: senderDeviceId,
// //   //     recipientSocketId: senderSocketId,
// //   //   );
// //   //   await ref.read(lastMessageProvider.notifier).updateAcceptedRequest(message);
// //   //   return true;
// //   // }
// // }

import 'dart:io';

import 'package:socket_io_client/socket_io_client.dart';

class SocketClient {
  Socket? socket;

  // server ip address
  static String serverIP =
      Platform.isIOS ? "http://localhost" : "http://10.0.2.2";

  // socket port
  static const String PORT = ":3000";

  // connection url
  static String connectionUrl = serverIP + PORT;

  void initialiseSocket() {
    socket = io(
      connectionUrl,
      OptionBuilder()
          .setTransports(['websocket'])
          .disableAutoConnect() // Use websocket transport
          .setExtraHeaders({
            "Authorization": "Bearer your_access_token_here",
            // Add any extra headers required by your server here
          })
          .build(),
    );

    // Listen for successful connection
    socket!.onConnect((_) {
      print("Connected to the server!");
    });

    // Listen for connection errors
    socket!.onConnectError((error) {
      print("Error connecting to the server: $error");
    });

    // Listen for connection timeouts
    socket!.onConnectTimeout((_) {
      print("Connection timed out");
    });

    // Listen for disconnections
    socket!.onDisconnect((_) {
      print("Disconnected from the server");
    });

    // Listen for custom events emitted by the server
    socket!.on("myCustomEvent", (data) {
      print("Received data from server: $data");
    });

    // Connect to the server
    socket!.connect();
  }
}
