import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/constants/strings.dart';

class BaseModel extends ChangeNotifier {
  // controller
  TextEditingController textEditingController = TextEditingController();

  //
  //
  String? input;
  //
  final formKey = GlobalKey<FormState>();

  // validate
  onValidate(context, String? value) {
    value = textEditingController.text;
    notifyListeners();
    if (value.length == 1 || value.length <= 4) {
      developer.log('Button was pressed', time: DateTime.now());
      return "Your name is too short";
    }
    if (value.trim().isEmpty == true) {
      return "Enter a value";
    } else {
      return;
    }
  }

  //
  onPressEnter(context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, chatPage);
    }
  }
}
