import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';
import 'package:flutter_chat_app_using_socket/views/reusableWidgets/chat/titleView.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
      children: [
        AdaptivePositioned(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GeneralTextDisplay(
                  'Messages', black, 1, 20, FontWeight.w900, "message")
            ],
          ),
          left: 15,
          top: 20,
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
                  hint: "Search Messages",
                  textFieldLabel: "Search Messages",
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
            left: sS(context).cW(width: 15),
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
                      time: "3hr",
                      withTime: true),
                  titleView(context,
                      name: 'Mrs Indomie',
                      username: 's@frankydunga',
                      image: "images/mrs_indomie.png",
                      withTime: true),
                  titleView(context,
                      name: 'Emeka Nwoke',
                      username: 's@frankydunga',
                      image: "images/image_avatar.png",
                      time: "2hr",
                      withTime: true),
                  titleView(context,
                      name: 'Ben Johnson',
                      username: 's@frankydunga',
                      image: "images/ben_johnson.png",
                      withTime: true),
                  titleView(context,
                      name: 'Mercy Anna',
                      username: 's@frankydunga',
                      image: "images/mercy_anna.png",
                      withTime: true),
                  titleView(context,
                      name: 'Frank Shobe',
                      username: 's@frankydunga',
                      image: null,
                      time: '2hr',
                      withTime: true),
                  titleView(context,
                      name: 'Frank Shobe',
                      username: 's@frankydunga',
                      image: "images/mr_marcaroni.png",
                      withTime: true),
                  titleView(context,
                      name: 'Frank Mensa',
                      username: 's@frankydunga',
                      image: null,
                      withTime: true),
                ],
              ),
            ))
      ],
      floatingActionButton: FloatingActionButton(
        backgroundColor: hexColor("272A7C"),
        onPressed: () {},
        child: GeneralIconDisplay(LineIcons.comments, white, UniqueKey(), 25),
      ),
    );
  }
}
