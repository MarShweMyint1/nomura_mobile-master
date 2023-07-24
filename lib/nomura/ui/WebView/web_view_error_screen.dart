import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/WebView/web_view_setting.dart';
import 'package:nomura_mobile/nomura/utils.dart';

class WebViewErrorScreen extends ConsumerStatefulWidget {
  const WebViewErrorScreen({super.key, required this.errorLogId});

  final String errorLogId;

  @override
  ConsumerState<WebViewErrorScreen> createState() => _WebViewErrorScreenState();
}

class _WebViewErrorScreenState extends ConsumerState<WebViewErrorScreen> {
  bool loadComplete = false;
  bool isBiometric = true;
  String username = "";

  @override
  void initState() {
    _listenBiometric();
    getUserName();
    super.initState();
  }

  getUserName() async {
    var name = await SaveLocal().getUserid();

    setState(() {
      username = name;
    });
    debugPrint('get user id  ===============> $username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(AppMargin.m32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringUtils.webviewErrorTitleText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    fontFamily: FontUtils.helvetica,
                    color: ColorUtils.primary,
                    fontWeight: FontWeightUtils.medium,
                    height: 1.5,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                    bottom: 20,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset('assets/404_Error.png'),
                ),
                Text(
                  '${StringUtils.webviewErrorBodyText}${widget.errorLogId}',
                  style: TextStyle(
                    fontSize: FontSize.s12,
                    fontFamily: FontUtils.arial,
                    color: ColorUtils.primary,
                    fontWeight: FontWeightUtils.regular,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Container(
                //   padding: const EdgeInsets.all(AppPadding.p32),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     mainAxisSize: MainAxisSize.min,
                //     children: [

                //       // const SizedBox(
                //       //   height: AppSize.s28,
                //       // ),
                //     ],
                //   ),
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.2,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Routes.initRoute,
                        (route) => false,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: AppSize.s16),
                          Text(
                            "Back To Login",
                            style:
                                getApplicationTheme().textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // persistentFooterButtons: [

        // ],
        bottomSheet:
            WebViewSetting(username: username, isBiometric: isBiometric));
  }

  _listenBiometric() async {
    await SaveLocal().getSupportedDevice().then((hasBiometric) {
      isBiometric = hasBiometric;
    });
  }
}
