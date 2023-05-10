import 'dart:developer' as developer;

import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/baseModel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
      viewModelBuilder: () => BaseModel(),
      builder: (context, model, child) => BaseUi(children: [
        AdaptivePositioned(
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, groupChatPage);
                developer.log("The initialise group button was pressed");
              },
              splashColor: green,
              child: GeneralTextDisplay(
                  "Initiate Group Chat", blue, 1, 20, FontWeight.bold, ""),
            ),
            top: sS(context).h * 0.4,
            left: sS(context).w * 0.2)
      ]),
    );
  }
}
