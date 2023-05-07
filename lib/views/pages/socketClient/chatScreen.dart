import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/socketClientViewModel/chatScreenViewModel.dart';
import 'package:flutter_chat_app_using_socket/views/pages/chatTitle.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const String ROUTES_ID = 'chat_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatScreenViewModel>.reactive(
        viewModelBuilder: () => ChatScreenViewModel(),
        onViewModelReady: (model) {
          model.onChatScreen(context);
        },
        builder: (BuildContext context, model, Widget? child) =>
            BaseUi(allowBackButton: false, children: [
              AdaptivePositioned(
                  GeneralTextDisplay(
                      "Chat Screen", black, 1, 30, FontWeight.bold, ""),
                  top: 70,
                  left: 20,
                  right: 20),
              AdaptivePositioned(
                ChatTitle(
                  chatUser: model.chatUsers,
                  onlineStatus: OnlineStatus.connecting,
                ),
                top: 80,
              ),
              AdaptivePositioned(
                S(
                  h: 100,
                  child: ListView.builder(
                      itemCount: model.chatUsers!.length,
                      itemBuilder: (itemBuilder, index) {
                        return GeneralTextDisplay(model.chatUsers![index].name!,
                            black, 1, 20, FontWeight.normal, "");
                      }),
                ),
                top: 120,
                left: 20,
              ),
              Positioned(
                  bottom: sS(context).cH(height: 40),
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: model.chatEditingController,
                          inputFormatters: [],
                          decoration: const InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            contentPadding: EdgeInsets.all(10),
                            hintText: "Type here",
                            filled: true,
                            fillColor: white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: GeneralIconDisplay(
                            LineIcons.arrowRight, black, UniqueKey(), 20),
                      )
                    ],
                  ))
            ]));
  }
}