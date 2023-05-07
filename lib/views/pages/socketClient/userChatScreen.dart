import 'package:flutter_chat_app_using_socket/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/socketClientViewModel/userChatViewModel.dart';

import 'chatScreen.dart';

class UserChatScreen extends StatelessWidget {
  const UserChatScreen({Key? key}) : super(key: key);
  static const String ROUTES_ID = 'user_chat_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserChatViewModel>.reactive(
        viewModelBuilder: () => UserChatViewModel(),
        onViewModelReady: (model) {
          model.onChatScreen(context);
        },
        builder: (BuildContext context, model, Widget? child) =>
            BaseUi(allowBackButton: false, safeTop: true, children: [
              AdaptivePositioned(
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: GeneralIconDisplay(
                            LineIcons.arrowLeft, black, UniqueKey(), 20),
                      ),
                      GeneralTextDisplay("User Chat Screen", black, 1, 20,
                          FontWeight.bold, ""),
                    ],
                  ),
                  top: 30,
                  left: 20,
                  right: 20),
              AdaptivePositioned(
                  top: 50,
                  left: 20,
                  right: 20,
                  S(
                    h: 300,
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: model.chatUsers?.length,
                                itemBuilder: (itemBuilder, index) {
                                  return ListTile(
                                    onTap: () {
                                      G.loggedInUser = model.chatUsers![index];
                                      Navigator.pushNamed(
                                          context, ChatScreen.ROUTES_ID);
                                    },
                                    title: Text(model.chatUsers![index].name!),
                                  );
                                }))
                      ],
                    ),
                  )),
            ]));
  }
}
