import 'dart:developer' as developer;

import 'package:flutter_chat_app_using_socket/part%201%20(adhara-package)/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/models/userModel.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class LoginViewModel extends BaseModel {
  // text editing controller
  TextEditingController usernameController = TextEditingController();

  // focus node
  FocusNode usernameFocusNode = FocusNode();

  // bool
  bool usernameError = false;

  //login user
  UserModel? me;

  // login
  onLogin(context) {
    if (usernameController.text.isEmpty) {
      usernameError = true;
      notifyListeners();
    }

    me = G.dummyUser![0];
    notifyListeners();
    if (usernameController.text != 'a') {
      me = G.dummyUser![1];
      developer.log("${me!.name}");
      notifyListeners();
    }
    G.loggedInUser = me;
    notifyListeners();
    onOpenUserListScreen(context);
  }
}
