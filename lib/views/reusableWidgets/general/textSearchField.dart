import 'package:flutter/material.dart';
import 'package:flutter_chat_app_using_socket/model/utilities/imports/flutterImport.dart';

import '../../../model/utilities/constants/colors.dart';
import '../../../model/utilities/constants/strings.dart';
import '../../uiElements/generalTextFieldDisplay.dart';
import 'hexColor.dart';

Widget textAndSearchField(context,
    {required TextInputType textInputType,
    required TextEditingController controller,
    required String hint,
    required String labelText,
    required Function onChanged,
    required List<TextInputFormatter> inputFormatter,
    required bool errorTextActive,
    required FocusNode focusNode,
    required String textFieldLabel,
    required Color outLineBorderColor,
    Widget? prefix,
    Widget? suffixIcon,
    required Widget? prefixIcon,
    bool? obscureText,
    Color? borderColor,
    bool? enabled,
    double? width}) {
  return FormattedTextFields(
    keyInputType: textInputType,
    textFieldController: controller,
    textFieldHint: hint,
    enabled: enabled ?? true,
    textFieldLineSpan: 1,
    height: 52,
    width: width ?? 327,
    containerColor: white,
    noBorder: false,
    autoFocus: false,
    inputFormatters: inputFormatter,
    onChangedFunction: onChanged,
    errorTextActive: errorTextActive,
    focusNode: focusNode,
    prefixIcon: prefixIcon,
    prefix: prefix,
    suffixIcon: suffixIcon,
    textFont: 15,
    hintFont: 14,
    borderRadius: 10,
    cursorColor: white,
    obscureText: obscureText ?? false,
    hintColor: grey.withOpacity(0.2),
    outLineBorderColor: outLineBorderColor,
    focusBorderColor: errorTextActive ? transparent : hexColor('BDBDBD'),
    textFontWeight: FontWeight.w500,
    hintFontWeight: FontWeight.w400,
    contentPadding: EdgeInsets.only(
        left: sS(context).cW(width: 16),
        right: sS(context).cW(width: 16),
        top: sS(context).cH(height: 16),
        bottom: sS(context).cH(height: 15)),
    textFieldLabel: textFieldLabel,
    labelFont: 15,
    labelColor: hexColor('BDBDBD'),
    labelFontWeight: FontWeight.w600,
  );
}
