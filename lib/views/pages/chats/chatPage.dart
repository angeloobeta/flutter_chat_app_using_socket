import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseUi(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: hexColor('F1F2FF'),
                  child: GeneralIconDisplay(
                      LineIcons.angleLeft, hexColor('272A7C'), UniqueKey(), 17),
                )),
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralTextDisplay(
                    'Frank Shobe', black, 1, 14, FontWeight.w600, ""),
                GeneralTextDisplay(
                    's@frankydunga', grey, 1, 12, FontWeight.w600, "")
              ],
            )
          ],
          backgroundColor: white,
          elevation: 10,
        ),
        children: [
          AdaptivePositioned(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: hexColor('F1F2FF'),
                      child: GeneralIconDisplay(LineIcons.angleLeft,
                          hexColor('272A7C'), UniqueKey(), 17),
                    )),
                S(w: 8),
                Column(children: [
                  GeneralTextDisplay(
                      'Frank Shobe', black, 1, 14, FontWeight.w600, ""),
                  GeneralTextDisplay(
                      's@frankydunga', grey, 1, 12, FontWeight.w600, "")
                ]),
                S(w: 11)
              ],
            ),
            left: 15,
            top: 18,
          ),
          AdaptivePositioned(
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                imageAvatar(context),
              ],
            ),
            right: 16,
            top: 18,
          ),
          Positioned(
              left: sS(context).cW(width: 24),
              right: sS(context).cW(width: 24),
              top: sS(context).cH(height: 160),
              bottom: sS(context).cH(height: 15),
              child: SingleChildScrollView(
                child: Center(
                  child: GeneralTextDisplay(
                      "Chat", black, 1, 20, FontWeight.w400, ""),
                ),
              ))
        ]);
  }
}
