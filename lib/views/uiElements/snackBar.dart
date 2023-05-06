import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

snackBarWidget(BuildContext context, {required String text}) {
  SnackBar snackBar = SnackBar(
    content: GeneralTextDisplay(
      text,
      blue,
      3,
      10,
      FontWeight.w400,
      'snack bar text',
      textAlign: TextAlign.center,
    ),
    backgroundColor: white,
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  return ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
