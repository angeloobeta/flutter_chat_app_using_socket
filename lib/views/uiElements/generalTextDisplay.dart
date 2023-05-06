import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class GeneralTextDisplay extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;

  GeneralTextDisplay(this.inputText, this.textColor, this.noOfTextLine,
      this.textFontSize, this.textFontWeight, this.textSemanticLabel,
      {this.textDecoration,
      this.textAlign,
      this.decorationColor,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Text(
      inputText,
      style: GoogleFonts.urbanist(
          textStyle: TextStyle(
              // add line height to the text widget if the design look different
              color: textColor,
              letterSpacing: letterSpacing ?? 0.02,
              fontSize: orientation == Orientation.portrait
                  ? dynamicSize.height * (textFontSize! / 800)
                  : dynamicSize.width * (textFontSize! / 800),
              fontWeight: textFontWeight,
              decoration: textDecoration ?? TextDecoration.none,
              decorationColor: decorationColor ?? black,
              decorationStyle: TextDecorationStyle.solid)),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
  }
}

// rubik text

class RubikText extends StatelessWidget {
  final String inputText;
  final double? textFontSize, letterSpacing;
  final FontWeight textFontWeight;
  final int noOfTextLine;
  final String textSemanticLabel;
  final Color textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;

  RubikText(this.inputText, this.textColor, this.noOfTextLine,
      this.textFontSize, this.textFontWeight, this.textSemanticLabel,
      {this.textDecoration,
      this.textAlign,
      this.decorationColor,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    Size dynamicSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;
    return Text(
      inputText,
      style: GoogleFonts.rubik(
          textStyle: TextStyle(
              // add line height to the text widget if the design look different
              color: textColor,
              letterSpacing: letterSpacing ?? 0.02,
              fontSize: orientation == Orientation.portrait
                  ? dynamicSize.height * (textFontSize! / 800)
                  : dynamicSize.width * (textFontSize! / 800),
              fontWeight: textFontWeight,
              decoration: textDecoration ?? TextDecoration.none,
              decorationColor: decorationColor ?? black,
              decorationStyle: TextDecorationStyle.solid)),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel,
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}
