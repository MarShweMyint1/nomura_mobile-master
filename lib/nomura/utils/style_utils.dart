import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/utils.dart';

TextStyle _getTextStyle(
    {required double fontSize,required String fontFamily,required Color color,required FontWeight fontWeight,FontStyle? fontStyle}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    fontStyle: fontStyle
  );
}


//bold
TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize:fontSize,fontFamily: FontUtils.helvetica, color:color, fontWeight:FontWeightUtils.bold);
}

//itelic
TextStyle getItalicStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
       fontSize:fontSize,fontFamily: FontUtils.helvetica,color: color,fontWeight:FontWeightUtils.medium,fontStyle: FontStyle.italic);
}

//thin
TextStyle getThinStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize:fontSize,fontFamily: FontUtils.helvetica,color: color,fontWeight: FontWeightUtils.light);
}


//bold
TextStyle getArialBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize:fontSize,fontFamily: FontUtils.arial, color:color, fontWeight:FontWeightUtils.bold);
}

//itelic
TextStyle getArialItalicStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
       fontSize:fontSize,fontFamily: FontUtils.arial,color: color,fontWeight:FontWeightUtils.medium,fontStyle: FontStyle.italic);
}

//thin
TextStyle getArialRegularStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize:fontSize,fontFamily: FontUtils.arial,color: color,fontWeight: FontWeightUtils.regular);
}