import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';

import '../../../model/utilities/imports/generalImport.dart';

class ChatTitle extends StatelessWidget {
  UserModel? chatUser;
  OnlineStatus? onlineStatus;
  ChatTitle({Key? key, required chatUser, required onlineStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GeneralTextDisplay("", black, 1, 20, FontWeight.bold, ""),
          GeneralTextDisplay(getStatusText(), grey, 1, 20, FontWeight.bold, "")
        ],
      ),
    );
  }

  getStatusText() {
    if (onlineStatus == OnlineStatus.online) {
      return "online";
    } else if (onlineStatus == OnlineStatus.offline) {
      return "offline";
    } else {
      return "connecting";
    }
  }
}
