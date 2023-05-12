import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/viewmodel/baseModel.dart';

class GroupChat extends StatelessWidget {
  const GroupChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BaseModel>.reactive(
        viewModelBuilder: () => BaseModel(),
        builder: (context, model, child) {
          return BaseUi(safeTop: true, children: [
            AdaptivePositioned(
              top: 20,
              left: 20,
              right: 20,
              S(
                  h: 100,
                  child: GeneralTextDisplay("Group Chat Menu",
                      grey.withOpacity(0.9), 1, 30, FontWeight.bold, "")),
            ),
            AdaptivePositioned(
              top: sS(context).h * 0.3,
              left: 10,
              right: 20,
              AlertDialog(
                actionsPadding: EdgeInsets.all(10),
                actionsAlignment: MainAxisAlignment.spaceAround,
                actionsOverflowDirection: VerticalDirection.up,
                actions: [
                  TextButton(
                      onPressed: () {
                        // model.onValidate(
                        //     context, model.textEditingController.text);
                        // model.onPressEnter(context);
                        Navigator.pushNamed(
                            context,
                            // arguments: model.textEditingController.text,
                            chatPage);
                      },
                      child: Text("Enter")),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"))
                ],
                title: const Text("Enter a group name"),
                backgroundColor: white.withOpacity(0.8),
                content: Form(
                  key: model.formKey,
                  child: TextFormField(
                    cursorColor: black,
                    controller: model.textEditingController,
                    onEditingComplete: () => model.onValidate(
                        context, model.textEditingController.text),
                    validator: (value) => model.onValidate(context, value),
                  ),
                ),
              ),
            )
          ]);
        });
  }
}
