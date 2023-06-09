// * this function creates a combination of the text and
// * text field used in the project
import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

Widget textAndTextField(context,
    {required TextInputType textInputType,
    required TextEditingController controller,
    required String hint,
    required String labelText,
    required Function onChanged,
    required List<TextInputFormatter> inputFormatter,
    required bool errorTextActive,
    required FocusNode focusNode,
    required Widget? prefix,
    Widget? suffix,
    Widget? suffixIcon,
    Widget? prefixIcon,
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
    outLineBorderColor: black,
    focusBorderColor: errorTextActive ? transparent : white,
    textFontWeight: FontWeight.w500,
    hintFontWeight: FontWeight.w400,
    contentPadding: EdgeInsets.only(
        left: sS(context).cW(width: 16),
        right: sS(context).cW(width: 16),
        top: sS(context).cH(height: 16),
        bottom: sS(context).cH(height: 15)),
    textFieldLabel: 'Search people',
    labelFont: 15,
    labelColor: black,
    labelFontWeight: FontWeight.w600,
  );
}
