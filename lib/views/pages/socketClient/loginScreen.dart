import 'package:flutter_chat_app_using_socket/globalValues.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/socketClientViewModel/loginViewModel.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String ROUTES_ID = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        onViewModelReady: (model) {
          G.initialDummy();
        },
        viewModelBuilder: () => LoginViewModel(),
        builder: (BuildContext context, model, Widget? child) =>
            BaseUi(allowBackButton: false, children: [
              AdaptivePositioned(
                GeneralTextDisplay(
                    "Let's Chat", black, 1, 20, FontWeight.bold, ""),
                top: 50,
                left: 20,
                right: 20,
              ),
              AdaptivePositioned(
                S(
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
                ),
                top: sS(context).h * 0.5,
                left: 20,
                right: 20,
              )
            ]));
  }
}
