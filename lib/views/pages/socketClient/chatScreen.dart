import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/socketClientViewModel/chatScreenViewModel.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const String ROUTES_ID = 'chat_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatScreenViewModel>.reactive(
        viewModelBuilder: () => ChatScreenViewModel(),
        builder: (BuildContext context, model, Widget? child) =>
            BaseUi(allowBackButton: false, children: [
              AdaptivePositioned(
                  GeneralTextDisplay(
                      "Chat Screen", black, 1, 20, FontWeight.bold, ""),
                  top: 70,
                  left: 20,
                  right: 20),
              AdaptivePositioned(
                S(
                  h: 300,
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.builder(
                              itemCount: 3,
                              itemBuilder: (itemBuilder, index) {
                                return ListTile(
                                  title: Text("model.chatUsers[index].name!"),
                                  // Text(model.chatUsers[index].name!),
                                );
                              }))
                    ],
                  ),
                ),
              )
            ]));
  }
}
