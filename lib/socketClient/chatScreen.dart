import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static const String ROUTES_ID = 'chat_screen';
  // List<UserModel> chatUsers;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        builder: (BuildContext context, model, Widget? child) =>
            BaseUi(allowBackButton: false, children: [
              AdaptivePositioned(GeneralTextDisplay(
                  "Chat User Screen", black, 1, 20, FontWeight.bold, "")),
              AdaptivePositioned(S(
                h: 300,
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: model.chatUsers.length,
                            itemBuilder: (itemBuilder, index) {
                              UserModel usermodel = model.chatUsers[index];
                              return ListTile(
                                title: Text(usermodel.name!),
                              );
                            }))
                  ],
                ),
              ))
            ]));
  }
}
