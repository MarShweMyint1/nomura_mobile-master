import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/utils/color_utils.dart';
import 'package:nomura_mobile/nomura/utils/values_utils.dart';

AppBar nomuraAppbar(BuildContext context, {List<Widget> actions = const []}) =>
    AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
      leadingWidth: 80,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(AppMargin.m16),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.replay,
            color: ColorUtils.primary,
          ),
        ),
      ),
      actions: actions,
    );

AppBar nomuraTextAppbar() => AppBar(
      toolbarHeight: AppSize.s150,
      automaticallyImplyLeading: false,
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(top: 0, left: AppPadding.p16),
        child: Image.asset(
          'assets/nomura_name.png',
          width: 190,
          height: 40,
        ),
      ),
    );

AppBar nomuraActionAppbar(BuildContext context,
        {List<Widget> actions = const [], required Function press}) =>
    AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 80,
      leadingWidth: 80,
      leading: InkWell(
        onTap: () {
          press();
        },
        child: Container(
          margin: const EdgeInsets.all(AppMargin.m16),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.replay,
            color: ColorUtils.primary,
          ),
        ),
      ),
      actions: actions,
    );
