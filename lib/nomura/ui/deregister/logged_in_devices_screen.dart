import 'package:flutter/material.dart';
import 'package:nomura_mobile/nomura/utils/font_utils.dart';

import '../../utils/color_utils.dart';
import '../../utils/values_utils.dart';

class LoggedInDevicesScreen extends StatelessWidget {
  const LoggedInDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.primary,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.only(
                    top: AppMargin.m50,
                    left: AppMargin.m20,
                    bottom: AppMargin.m50),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: ColorUtils.white,
                    borderRadius: BorderRadius.circular(AppSize.s10)),
                child: Image.asset(
                  "assets/back.png",
                  height: AppSize.s28,
                  width: AppSize.s28,
                  color: ColorUtils.primary,
                )),
          ),
          Container(
            margin:
                const EdgeInsets.only(left: AppMargin.m32, top: AppMargin.m60),
            child: Text(
              'Your login devices',
              style: TextStyle(fontSize: FontSize.s29, color: ColorUtils.white),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: AppMargin.m32, top: AppMargin.m16, bottom: AppMargin.m50),
            child: Text(
              'Select device to deregister.',
              style: TextStyle(
                  fontSize: FontSize.s16,
                  color: ColorUtils.white,
                  fontWeight: FontWeightUtils.light),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                  top: AppPadding.p18,
                  left: AppPadding.p16,
                  right: AppMargin.m16),
              decoration: BoxDecoration(
                color: ColorUtils.black,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSize.s28),
                    topRight: Radius.circular(AppSize.s28)),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: ColorUtils.grey))),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p16),
                    title: Row(children: [
                      Checkbox(
                          activeColor: ColorUtils.white,
                          checkColor: ColorUtils.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s3)),
                          side: BorderSide(width: 2, color: ColorUtils.grey),
                          value: true,
                          onChanged: (value) {}),
                      Icon(
                        Icons.phone_android,
                        color: ColorUtils.yellow,
                      ),
                      const SizedBox(
                        width: AppSize.s12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Iphone 12 Pro . California, United States',
                            style: TextStyle(
                                fontSize: FontSize.s14,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeightUtils.light),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          Text(
                            'Currently using',
                            style: TextStyle(color: ColorUtils.green),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: ColorUtils.grey))),
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: AppPadding.p16),
                    title: Row(children: [
                      Checkbox(
                          activeColor: ColorUtils.white,
                          checkColor: ColorUtils.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s3)),
                          side: BorderSide(width: 2, color: ColorUtils.grey),
                          value: false,
                          onChanged: (value) {}),
                      Icon(
                        Icons.phone_android,
                        color: ColorUtils.yellow,
                      ),
                      const SizedBox(
                        width: AppSize.s12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Samsung A30 . Davao City, Phillipines',
                            style: TextStyle(
                                fontSize: FontSize.s14,
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeightUtils.light),
                          ),
                          const SizedBox(
                            height: AppSize.s12,
                          ),
                          Text(
                            '',
                            style: TextStyle(color: ColorUtils.green),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                const Expanded(child: SizedBox()),
                MaterialButton(
                  color: ColorUtils.white,
                  minWidth: MediaQuery.of(context).size.width * 0.8,
                  height: 55,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s20)),
                  onPressed: () {},
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      Icons.close_rounded,
                      color: ColorUtils.primary,
                    ),
                    Text(
                      '  Deregister',
                      style: TextStyle(
                          color: ColorUtils.primary, fontSize: FontSize.s20),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 100,
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
