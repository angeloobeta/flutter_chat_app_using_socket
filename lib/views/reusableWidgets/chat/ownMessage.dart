import 'package:flutter/material.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/constants/colors.dart';

import '../../../model/utilities/constants/strings.dart';

Widget ownMessage(context,
    {String? messageBody, String? sender, bool? fromMe}) {
  return Align(
    alignment: fromMe == true ? Alignment.bottomRight : Alignment.bottomLeft,
    child: ConstrainedBox(
      constraints: BoxConstraints(maxWidth: sS(context).w * 0.8),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(sender!,
                style: TextStyle(
                    color: fromMe == true ? green : blue,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            Text(
              messageBody!,
              style: const TextStyle(
                  color: black, fontSize: 14, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    ),
  );
}
