import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

Widget titleView(BuildContext context,
    {required String name,
    required String username,
    required bool withTime,
    String? time,
    String? subtitle,
    String? image}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: S(
      w: 375,
      h: withTime == true ? 60 : 45,
      child: Stack(
        children: [
          // image avatar
          AdaptivePositioned(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [imageAvatar(context, image: image)],
              ),
              left: 0,
              top: 0),
          // name
          AdaptivePositioned(
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GeneralTextDisplay(name, black, 1, 14, FontWeight.w600, "name"),
                S(w: 5),
                if (withTime == true)
                  GeneralTextDisplay(
                    username,
                    grey,
                    1,
                    12,
                    FontWeight.w600,
                    "username",
                  ),
              ],
            ),
            left: 40,
            top: 0,
          ),

          // username
          if (withTime != true)
            AdaptivePositioned(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GeneralTextDisplay(
                    username,
                    grey,
                    1,
                    12,
                    FontWeight.w400,
                    "username",
                    letterSpacing: 0.008,
                  ),
                ],
              ),
              left: 40,
              top: 22,
            ),

          //subtitle
          if (withTime == true)
            AdaptivePositioned(
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GeneralTextDisplay(
                    "Nibh blandit vel vitae libero nec \nmalesuada blandit. ",
                    black,
                    2,
                    12,
                    FontWeight.w400,
                    "subtitle",
                    letterSpacing: 0.008,
                  ),
                ],
              ),
              left: 40,
              top: 20,
            ),

          if (withTime == true)
            AdaptivePositioned(
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GeneralTextDisplay(
                    time ?? "1hr",
                    black,
                    1,
                    12,
                    FontWeight.w400,
                    "time",
                    letterSpacing: 0.008,
                  ),
                ],
              ),
              right: 0,
              top: 0,
            ),

          // title

          // trailing
        ],
      ),
    ),
  );
}
