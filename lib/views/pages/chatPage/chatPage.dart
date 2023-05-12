import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/chat/chatViewModel.dart';

import '../../reusableWidgets/chat/ownMessage.dart';

class ChatPage extends StatelessWidget {
  // final String fromTextEditing;
  const ChatPage({
    Key? key,
    // required this.fromTextEditing
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
        onViewModelReady: (model) {
          // model.onConnectSocket(context);
        },
        viewModelBuilder: () => ChatViewModel(),
        builder: (context, model, child) {
          return BaseUi(safeTop: true, children: [
            AdaptivePositioned(
              top: 20,
              left: 20,
              right: 20,
              S(
                  h: 100,
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            // model.onDisconnectSocket(context);
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_outlined)),
                      GeneralTextDisplay("Text Chat Page",
                          grey.withOpacity(0.9), 1, 30, FontWeight.bold, ""),
                    ],
                  )),
            ),
            Positioned(
                left: 20,
                right: 20,
                top: 100,
                bottom: 120,
                child: S(
                  h: 560,
                  child: ListView.builder(
                    itemCount: model.listOfMessage?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ownMessage(context,
                          messageBody: model.listOfMessage![index].message,
                          sender: model.listOfMessage![index].from,
                          fromMe: model.listOfMessage![index].isFromMe);
                    },

                    // model.listOfMessage!
                    //     .map((e) => ownMessage(context, fromMe: true))
                    //     .toList(),
                  ),
                )),
            Positioned(
              left: 20,
              right: 20,
              bottom: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: model.payloadEditingController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.yellow),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: "Type your message",
                          enabled: true),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        // model.onSendData(context);
                      },
                      icon: const Icon(Icons.send_rounded))
                ],
              ),
            )
          ]);
        });
  }
}
