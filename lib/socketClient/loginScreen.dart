import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String ROUTES_ID = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        builder: (BuildContext context, model, Widget? child) =>
            BaseUi(allowBackButton: false, children: [
              AdaptivePositioned(GeneralTextDisplay(
                  "Let's Chat", black, 1, 20, FontWeight.bold, "")),
              AdaptivePositioned(S(
                h: 300,
                child: Column(
                  children: [
                    TextField(
                      controller: model.usernameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0))),
                          fillColor: white,
                          contentPadding: EdgeInsets.all(20),
                          filled: true),
                    ),
                    S(h: 20),
                    OutlinedButton(
                        onPressed: () => model.onLogin(context),
                        child: const Text("Login"))

                    // textAndTextField(context,
                    //     textInputType: TextInputType.text,
                    //     controller: model.usernameController,
                    //     hint: "Username",
                    //     labelText: "Enter your username",
                    //     onChanged: model.onChangeUsername(context),
                    //     inputFormatter: [TextInputFormatter],
                    //     errorTextActive: model.usernameError,
                    //     focusNode: model.usernameFocusNode,
                    //     prefix: "prefix")
                  ],
                ),
              ))
            ]));
  }
}
