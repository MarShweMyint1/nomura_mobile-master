import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/utils/theme_utils.dart';

Widget titleText(String text, {TextAlign textAlign = TextAlign.left}) => Text(
      text,
      style:
          getApplicationTheme().textTheme.displayLarge!.copyWith(height: 1.5),
      textAlign: textAlign,
      textScaleFactor: 1,
    );

Widget subtitleText(String text, {TextAlign textAlign = TextAlign.left}) =>
    Text(
      text,
      style: getApplicationTheme().textTheme.bodyLarge!.copyWith(height: 1.5),
      textAlign: textAlign,
      textScaleFactor: 1,
    );

Widget overAllText(String text, {TextAlign textAlign = TextAlign.left}) => Text(
      text,
      style: getApplicationTheme()
          .textTheme
          .bodyLarge!
          .copyWith(height: 1.5, fontSize: 12),
      textAlign: textAlign,
      textScaleFactor: 1,
    );
Widget bodyText(String text, {TextAlign textAlign = TextAlign.left}) => Text(
      text,
      style: getApplicationTheme().textTheme.displaySmall,
      textAlign: textAlign,
      textScaleFactor: 1,
    );
