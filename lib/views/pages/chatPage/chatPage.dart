import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/chat/chatViewModel.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatViewModel>.reactive(
        viewModelBuilder: () => ChatViewModel(),
        builder: (context, model, child) {
          return BaseUi(safeTop: true, children: [
            AdaptivePositioned(
              top: 20,
              left: 20,
              right: 20,
              S(
                  h: 100,
                  child: GeneralTextDisplay("Chat Page", grey.withOpacity(0.9),
                      1, 30, FontWeight.bold, "")),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: model.textEditingController,
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
                      onPressed: () {}, icon: const Icon(Icons.send_rounded))
                ],
              ),
            )
          ]);
        });
  }
}
