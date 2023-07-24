import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/route_manager.dart';
import 'package:nomura_mobile/nomura/ui/WebView/web_view_setting.dart';
import 'package:nomura_mobile/nomura/utils.dart';

class WebViewPage extends ConsumerStatefulWidget {
  const WebViewPage({super.key, required this.token});
  final String token;

  @override
  ConsumerState<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends ConsumerState<WebViewPage> {
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
    username = name;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(AppSize.s28),
              topRight: Radius.circular(AppSize.s28),
            ),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: IconButton(
                  iconSize: 50,
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.settingRoute),
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
              InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      "${UrlUtils.investCloudUrl}/${UrlUtils.investCloudEndPoint}?Token=${widget.token}&Locale=en-US"),
                ),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    javaScriptEnabled: true,
                  ),
                ),
                onLoadStart:
                    (InAppWebViewController controller, Uri? url) async {},
                onLoadStop:
                    (InAppWebViewController controller, Uri? url) async {},
                onProgressChanged: (controller, progress) {
                  if (progress / 100 == 1) {
                    setState(() {
                      loadComplete = true;
                    });
                  }
                },
                onUpdateVisitedHistory: (controller, url, androidIsReload) {
                  var logID = Uri.parse(url.toString())
                      .queryParameters['LogId']
                      .toString();
                  debugPrint('logId response ==============> $logID');
                  if (url
                      .toString()
                      .contains('/Membership/ExtPages/iXingError.aspx?LogId')) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.webviewErrorRoute,
                      (route) => false,
                      arguments: logID,
                    );
                  } else if (url.toString().contains(
                      'https://nomura-mfa-dev.southeastasia.cloudapp.azure.com/oidc/authorize')) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.initRoute,
                      (route) => false,
                    );
                  }
                },
              ),
              (!loadComplete)
                  ? Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.all(AppMargin.m12),
                        child: const CircularProgressIndicator(),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
        bottomSheet:
            WebViewSetting(username: username, isBiometric: isBiometric),
      ),
    );
  }

  void _listenBiometric() async {
    await SaveLocal().getSupportedDevice().then((hasBiometric) {
      isBiometric = hasBiometric;
      ref.read(isBiometricProvider.notifier).update((state) => hasBiometric);
    });
  }
}
