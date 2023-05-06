import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class NewMessagePage extends StatelessWidget {
  const NewMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(children: [
      AdaptivePositioned(
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: hexColor('F1F2FF'),
                  child: GeneralIconDisplay(
                      LineIcons.angleLeft, hexColor('272A7C'), UniqueKey(), 17),
                )),
            S(
              w: 11,
            ),
            GeneralTextDisplay(
                'New Message', black, 1, 16, FontWeight.w600, "chats")
          ],
        ),
        left: 15,
        top: 18,
      ),
      AdaptivePositioned(
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [imageAvatar(context)],
        ),
        right: 16,
        top: 18,
      ),
      AdaptivePositioned(
        Row(
          children: [
            textAndSearchField(context,
                labelText: "Search people",
                textInputType: TextInputType.text,
                controller: TextEditingController(),
                hint: "Search people",
                textFieldLabel: "Search people",
                prefixIcon: GeneralIconDisplay(
                    LineIcons.search, hexColor('BDBDBD'), UniqueKey(), 30),
                onChanged: () {},
                inputFormatter: [],
                enabled: false,
                errorTextActive: false,
                focusNode: FocusNode(),
                borderColor: const Color.fromRGBO(231, 231, 231, 1),
                prefix: null,
                outLineBorderColor: hexColor('BDBDBD')),
          ],
        ),
        left: 15,
        top: 80,
      ),
      Positioned(
          left: sS(context).cW(width: 24),
          right: sS(context).cW(width: 24),
          top: sS(context).cH(height: 160),
          bottom: sS(context).cH(height: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                titleView(context,
                    name: 'Frank Dunga',
                    username: 's@frankydunga',
                    image: null,
                    withTime: false),
                titleView(context,
                    name: 'Frank Shobe',
                    username: 's@frankydunga',
                    image: null,
                    withTime: false),
                titleView(context,
                    name: 'Frank Mensa',
                    username: 's@frankydunga',
                    image: null,
                    withTime: false),
              ],
            ),
          ))
    ]);
  }
}
