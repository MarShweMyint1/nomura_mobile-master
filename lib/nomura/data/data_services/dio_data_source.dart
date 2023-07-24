import 'dart:io';
import 'dart:math';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomura_mobile/nomura/data/data_services/remote_data_source.dart';
import 'package:nomura_mobile/nomura/data/model/authz_model.dart';
import 'package:nomura_mobile/nomura/data/model/device_primality_model.dart';
import 'package:nomura_mobile/nomura/data/model/invest_cloud_model.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_login_model.dart';
import 'package:nomura_mobile/nomura/data/model/legacy_proceed_model.dart';
import 'package:nomura_mobile/nomura/data/model/reset_pin_authorize/reset_pin_authorize.dart';
import 'package:nomura_mobile/nomura/data/params/mobile_client_auth_param.dart';
import 'package:nomura_mobile/nomura/data/params/invest_cloud_param.dart';
import 'package:nomura_mobile/nomura/data/params/pwd_params.dart';
import 'package:nomura_mobile/nomura/data/model/token_model.dart';
import 'package:nomura_mobile/nomura/data/params/resend_sms.dart';
import 'package:nomura_mobile/nomura/data/params/submit_sms.dart';
import 'package:nomura_mobile/nomura/data/params/token_param.dart';
import 'package:nomura_mobile/nomura/data/params/validate_user.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:nomura_mobile/nomura/riverpod/collection/collection_provider.dart';
import 'package:nomura_mobile/nomura/domain/operation/save_local.dart';
import 'package:pkce/pkce.dart';

class DioDataSource implements IRemoteDataSource {
  final String _url;
  final Dio _client;
  final CookieJar _cookieJar;

  DioDataSource({
    required String url,
  })  : _url = url,
        _client = Dio(BaseOptions(
            connectTimeout: const Duration(seconds: 60),
            receiveTimeout: const Duration(seconds: 60))),
        _cookieJar = CookieJar() {
    _client.interceptors.add(CookieManager(_cookieJar));
    sendSecureHTTPSRequest();
  }

  Future<void> sendSecureHTTPSRequest() async {
    ByteData rootCACertificate = await rootBundle.load("assets/cert.crt");
    (_client.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (client) {
      client.badCertificateCallback =
          ((X509Certificate cert, String host, int port) => true);
      SecurityContext context = SecurityContext(withTrustedRoots: true);

      context
          .setTrustedCertificatesBytes(rootCACertificate.buffer.asUint8List());

      HttpClient httpClient = HttpClient(context: context);

      return httpClient;
    };
  }

  @override
  Future<LegacyLoginModel> legacyLoginInit(ValidateUserParams params) async {
    try {
      final options = Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      });
      var bodyParams = {
        'isiwebuserid': params.userName,
      };

      final response = await _client.post(
        _url,
        data: bodyParams,
        options: options,
      );
      debugPrint('response legacy login -----$response');
      if (response.statusCode == 200) {
        return LegacyLoginModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('Error 400,500===>$e');
      if (e is DioException) {
        if (e.error == DioException.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 400) {
          return LegacyLoginModel.fromJson(e.response!.data);
        }
        if (e.response!.statusCode == 401) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 500) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else {
          return LegacyLoginModel.fromJson(e.response!.data);
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future<dynamic> legacyProceed(ValidateUserParams params) async {
    _cookieJar.deleteAll();
    try {
      final option = Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      });
      var bodyParams = {
        'isiwebuserid': params.userName,
      };
      final response = await _client.post(
        _url,
        data: bodyParams,
        options: option,
      );
      final cookies = await _cookieJar.loadForRequest(Uri.parse(_url));
      var mailCookie = cookies
          .where((element) =>
              element.name ==
              "Session_Pre-register_legacy_email_SMS_login_realm")
          .first
          .toString()
          .substring(
              0,
              cookies
                  .where((element) =>
                      element.name ==
                      "Session_Pre-register_legacy_email_SMS_login_realm")
                  .first
                  .toString()
                  .indexOf(';'));

      SaveLocal().saveCookie(mailCookie);
      debugPrint('Mail Proceed Cookie<=====$mailCookie');

      if (response.statusCode == 200) {
        return LegacyProceedModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('Proceed Error===>$e');
      if (e is DioException) {
        if (e.error == DioException.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 400) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 401) {
          return LegacyLoginModel.fromJson(e.response!.data);
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future<dynamic> submitSMS(SubmitSMSParams params, WidgetRef ref) async {
    _cookieJar.deleteAll();
    try {
      var cookie = await SaveLocal().getCookies();
      final option = Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': cookie,
      });
      var bodyParams = {
        'isiwebuserid': params.userName,
        'mtanresponse': params.otpCode,
      };

      final response = await _client.post(
        _url,
        data: bodyParams,
        options: option,
      );
      debugPrint('Submit SMS Response===>${response.data}');
      final cookies = await _cookieJar.loadForRequest(Uri.parse(_url));
      var newCookie = cookies
          .where((element) =>
              element.name ==
              "Session_Pre-register_legacy_email_SMS_login_realm")
          .first
          .toString()
          .substring(
              0,
              cookies
                  .where((element) =>
                      element.name ==
                      "Session_Pre-register_legacy_email_SMS_login_realm")
                  .first
                  .toString()
                  .indexOf(';'));
      SaveLocal().saveCookie(newCookie);
      ref.read(cookieProvider.notifier).saveCookieList(cookies);
      debugPrint('SMS cookie===>$newCookie');

      if (response.statusCode == 200) {
        if (response.data['name'] == "MTANDialog") {
          return LegacyProceedModel.fromJson(response.data);
        } else {
          return LegacyLoginModel.fromJson(response.data);
        }
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('Error 400,500===>');
      if (e is DioException) {
        if (e.error == DioException.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 400) {
          return LegacyProceedModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 401) {
          return LegacyProceedModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          return LegacyProceedModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 500) {
          return LegacyProceedModel.fromJson(e.response!.data);
        } else {
          return LegacyProceedModel.fromJson(e.response!.data);
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future resendSMS(ResendSMSParams params) async {
    _cookieJar.deleteAll();
    try {
      var cookie = await SaveLocal().getCookies();
      final option = Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': cookie,
      });
      var bodyParams = {
        'isiwebuserid': params.userName,
        'generate': '${params.generate}',
      };
      final response = await _client.post(
        _url,
        data: bodyParams,
        options: option,
      );
      final cookies = await _cookieJar.loadForRequest(Uri.parse(_url));
      var newCookie = cookies
          .where((element) =>
              element.name ==
              "Session_Pre-register_legacy_email_SMS_login_realm")
          .first
          .toString()
          .substring(
              0,
              cookies
                  .where((element) =>
                      element.name ==
                      "Session_Pre-register_legacy_email_SMS_login_realm")
                  .first
                  .toString()
                  .indexOf(';'));
      SaveLocal().saveCookie(newCookie);
      if (response.statusCode == 200) {
        return LegacyProceedModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('Resend SMS Error===>$e');
      if (e is DioException) {
        if (e.error == DioException.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 400 || e.response!.statusCode == 401) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else {
          return LegacyLoginModel.fromJson(e.response!.data);
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future resendMail(ResendSMSParams params) async {
    _cookieJar.deleteAll();
    try {
      final option = Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      });
      var bodyParams = {
        'isiwebuserid': params.userName,
        'skipDeviceCheck': params.generate,
      };
      final response = await _client.post(
        _url,
        data: bodyParams,
        options: option,
      );
      debugPrint('Response ===>$response}');
      if (response.statusCode == 200) {
        return LegacyLoginModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('Error 400,500===>$e');
      if (e is DioException) {
        if (e.error == DioException.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 400) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 500) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else {
          return LegacyLoginModel.fromJson(e.response!.data);
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future authorize(WidgetRef ref) async {
    _cookieJar.deleteAll();
    var cookie = await SaveLocal().getCookies();

    try {
      final options = Options(headers: {
        'Cookie': cookie,
      });

      final response = await _client.get(
        _url,
        options: options,
      );
      final cookies = await _cookieJar.loadForRequest(Uri.parse(_url));
      debugPrint('Auth Cookie<====$cookies');
      var newCookie = cookies
          .where((element) =>
              element.name ==
              "Session_Pre-register_legacy_email_SMS_login_realm")
          .first
          .toString()
          .substring(
              0,
              cookies
                  .where((element) =>
                      element.name ==
                      "Session_Pre-register_legacy_email_SMS_login_realm")
                  .first
                  .toString()
                  .indexOf(';'));

      SaveLocal().saveCookie(newCookie);
      ref.read(cookieProvider.notifier).saveCookieList(cookies);

      debugPrint('New Auth Cookie===>$newCookie');
      if (response.statusCode == 200) {
        return response.data['trustedFacets'][0]['ids'];
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('Error 400,500===>$e');
      if (e is DioException) {
        if (e.error == DioException.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 400) {
          debugPrint(
              '400 error============================>${e.response!.data}');
        } else if (e.response!.statusCode == 401) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 500) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else {
          return LegacyLoginModel.fromJson(e.response!.data);
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future pwdAuth(PwdParams params) async {
    _cookieJar.deleteAll();
    try {
      SaveLocal().saveCookie("");
      final options = Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
      });
      var bodyParams = {
        'isiwebuserid': params.userName,
        'isiwebpasswd': params.pin,
      };

      final response = await _client.post(
        _url,
        data: bodyParams,
        options: options,
      );
      final cookies = await _cookieJar.loadForRequest(Uri.parse(_url));
      var newCookie = cookies
          .where((element) => element.name == "Session_Inband_Realm")
          .first
          .toString()
          .substring(
              0,
              cookies
                  .where((element) => element.name == "Session_Inband_Realm")
                  .first
                  .toString()
                  .indexOf(';'));

      SaveLocal().saveCookie(newCookie);
      debugPrint('GENERATE COOOKIE ===>> $newCookie');
      debugPrint('PWD===>$response');
      if (response.statusCode == 200) {
        debugPrint('Response Data ===>> ${response.data}');
        return LegacyLoginModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('Error 400,500===>$e');
      if (e is DioException) {
        if (e.error == DioException.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 400) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 500) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else {
          return LegacyLoginModel.fromJson(e.response!.data);
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  // ? Generate Sate
  String generateState(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  //for in_band authorization
  @override
  Future inbandAuthz() async {
    final pkcePair = PkcePair.generate();
    var codeChallenge = pkcePair.codeChallenge;
    var codeVerifier = pkcePair.codeVerifier;
    try {
      _cookieJar.deleteAll();
      var gState = generateState(9);
      var clientId = "772762de3fdd584426b4355b76530b8d";
      var redirectUri = "https://mobileclient/callback";
      var scope = "openid";
      var responseType = "code";
      var codeMethod = "S256";

      final cookie = await SaveLocal().getCookies();
      debugPrint("AUTHZ COOKIE ==>> ${cookie.toString()}");
      final option = Options(
        followRedirects: false,
        headers: {
          'Cookie': cookie,
          'Accept': 'application/json',
        },
      );

      debugPrint(
          "AUTHZ URL ====>>> $_url?client_id=$clientId&redirect_uri=$redirectUri&response_type=$responseType&scope=$scope&state=$gState&code_challenge=$codeChallenge&code_challenge_method=$codeMethod");

      final response = await _client.get(
          "$_url?client_id=$clientId&redirect_uri=$redirectUri&response_type=$responseType&scope=$scope&state=$gState&code_challenge=$codeChallenge&code_challenge_method=$codeMethod",
          options: option);
      debugPrint("AUTHZ Response ==>> $response");
      if (response.statusCode == 200) {
        debugPrint("AUTHZ Response 11==>>");
        var loc = response.headers['Location'].toString();
        debugPrint("AUTHZ Header Loc ==>> $loc");
        var locStr = loc.substring(1, loc.length - 1);
        debugPrint('AUTHZ RESPONSE LOC ===>> $locStr');
        String res =
            Uri.parse(locStr.toString()).queryParameters['code'].toString();
        debugPrint("RES ===>>> $res");
        // var responseData = [
        //   {"code": res}
        // ];
        // return res;
        // e.response!.data = [];
        response.data = {"code": res, "verifier": codeVerifier};
        debugPrint("RES 2 ===>>> ${response.data}");
        return AuthzModel.fromJson(response.data);
      } else {
        debugPrint("AUTHZ Response 22==>>");
        throw UnimplementedError();
      }
    } catch (e) {
      // debugPrint('$e');
      if (e is DioException) {
        debugPrint('AUTHZ RESPONSE CODE# ===>> ${e.response!.statusCode}');
        if (e.error == DioExceptionType.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 302) {
          debugPrint('AUTHZ RESPONSE CODE 302 Err ===>>');
          debugPrint(
            'Location ============> ${e.response!.headers['Location']}',
          );
          var loc = e.response!.headers['Location'].toString();
          var locStr = loc.substring(1, loc.length - 1);
          debugPrint('AUTHZ RESPONSE LOC ===>> $locStr');
          String res =
              Uri.parse(locStr.toString()).queryParameters['code'].toString();
          debugPrint("RES ===>>> $res");
          // var responseData = [
          //   {"code": res}
          // ];
          // return res;
          // e.response!.data = [];
          e.response!.data = {"code": res, "verifier": codeVerifier};
          debugPrint("RES 2 ===>>> ${e.response!.data}");
          return AuthzModel.fromJson(e.response!.data);
          // return res;
          // debugPrint(
          //     '302 error============================>${e.response!.data}');
        } else if (e.response!.statusCode == 400) {
          debugPrint(
              '400 error============================>${e.response!.data}');
        } else if (e.response!.statusCode == 500) {
          debugPrint(
              '500 error============================>${e.response!.data}');
        } else if (e.response!.statusCode == 404) {
          debugPrint('====================================>server down');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        } else {
          debugPrint(' error============================>${e.response!.data}');
        }
      } else {
        debugPrint('AUTHZ RESPONSE THROW ===>>');
        throw UnimplementedError();
      }
    }
  }

  @override
  Future<TokenModel> token(TokenParam params) async {
    try {
      debugPrint(
          'Start Token =======================> ${params.code} || ${params.codeVerifier}');
      var clientId = "772762de3fdd584426b4355b76530b8d";
      var clientSecret = "32fdc35f929c69f5bf69c2277c1a95b3";
      var redirectUrl = "https://mobileclient/callback";
      var grantType = "authorization_code";
      // final pkcePair = PkcePair.generate();
      // var codeVerifier = pkcePair.codeVerifier;

      final option = Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      });

      var bodyParams = {
        'client_id': clientId,
        'client_secret': clientSecret,
        'redirect_uri': redirectUrl,
        'grant_type': grantType,
        'code': params.code,
        'code_verifier': params.codeVerifier
      };
      debugPrint('URL  =======================>$_url');
      final response =
          await _client.post(_url, data: bodyParams, options: option);
      debugPrint('response  =======================>${response.data}');

      if (response.statusCode == 200) {
        return TokenModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      if (e is DioException) {
        debugPrint(
            '===================================>Error ${e.response!.data}');
        if (e.error == DioExceptionType.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }

        if (e.response!.statusCode == 404) {
          debugPrint('====================================>server down');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        } else {
          return TokenModel.fromJson(e.response!.data);
        }
        // else if (e.response!.statusCode == 500) {
        //   return TokenModel.fromJson(e.response!.data);
        // } else {
        //   return TokenModel.fromJson(e.response!.data);
        // }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future<InvestCloud> investCloud(InvestCloudParam params) async {
    try {
      debugPrint(
          'invest cloud access token =============> ${params.accessToken}');

      var bodyParam = {
        'Token': params.accessToken,
        'Locale': 'en-US',
      };

      final option = Options(
        followRedirects: true,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      );

      debugPrint('invest cloud url ==============>  $_url');
      final response =
          await _client.post(_url, data: bodyParam, options: option);
      if (response.statusCode == 200) {
        return InvestCloud.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('Error 400,500===>$e');
      if (e is DioException) {
        if (e.error == DioExceptionType.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        }
        if (e.response!.statusCode == 302) {
          List<String> loc = e.response!.headers['Location'] ?? [];
          debugPrint(
              'invest cloud response location =========> ${loc.join(' ')}');

          // var locStr = loc.substring(1, loc.length - 1);
          // debugPrint('AUTHZ RESPONSE LOC ===>> $locStr');
          // String res =
          //     Uri.parse(locStr.toString()).queryParameters['code'].toString();
          // debugPrint("RES ===>>> $res");

          var location = loc.join(' ');

          e.response!.data = {"nomuraHomePageLink": location};
          debugPrint("Invest Cloud 2 ===>>> ${e.response!.data}");
          return InvestCloud.fromJson(e.response!.data);
        }
        if (e.response!.statusCode == 400) {
          return InvestCloud.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 500) {
          return InvestCloud.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          debugPrint('====================================>server down');
          debugPrint(
              '===========================================>${e.response!.data}');
          throw UnimplementedError();
        } else {
          return InvestCloud.fromJson(e.response!.data);
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future devicePrimalityCheck(ValidateUserParams params) async {
    try {
      final option = Options(headers: {
        'Accept': 'application/json',
      });
      print("usesrname =>${params.userName}");
      final response = await _client.get('$_url?username=${params.userName}',
          options: option);
      debugPrint('response=======================>$response');
      if (response.statusCode == 200) {
        debugPrint('device primality 200============>$response');
        return DevicePrimalityModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      if (e is DioException) {
        if (e.error == DioExceptionType.connectionTimeout) {
          debugPrint('===================================>dio timeout');
          debugPrint(
              '===========================================>${e.response!.data}');
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 404) {
          debugPrint(
              '===========================================>404 ${e.response!.data}');
          return LegacyLoginModel.fromJson(e.response!.data);
        } else if (e.response!.statusCode == 401) {
          debugPrint(
              '===========================================>404 ${e.response!.data}');
          return LegacyLoginModel.fromJson(e.response!.data);
        } else {
          throw UnimplementedError();
        }
      }
    }
  }

  @override
  Future<LegacyLoginModel> mobileClientAuth(
      MobileClientAuthParam params, WidgetRef ref) async {
    try {
      debugPrint('working===');
      final option = Options(headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      });
      var body = {
        'isiwebuserid': params.isiwebuserid,
        'dispatchTargetId': params.dispatchTargetId
      };
      final response = await _client.post(_url, data: body, options: option);
      final cookies = await _cookieJar.loadForRequest(Uri.parse(_url));
      ref.read(cookieProvider.notifier).saveCookieList(cookies);
      var newCookie = cookies[0]
          .toString()
          .substring(0, cookies[0].toString().indexOf(';'));
      SaveLocal().saveCookie(newCookie);

      debugPrint('response ==>$response');
      if (response.statusCode == 200) {
        return LegacyLoginModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('error=====>${e.toString()}');
      if (e is DioException) {
        if (e.error == DioExceptionType.connectionTimeout) {
          throw UnimplementedError();
        } else if (e.response!.statusCode == 401) {
          debugPrint('401====>${e.response}');
          return LegacyLoginModel.fromJson(e.response!.data);
        } else {
          throw UnimplementedError();
        }
      } else {
        throw UnimplementedError();
      }
    }
  }

  @override
  Future resetPinAuthorize(String cookie, WidgetRef ref) async {
    try {
      final option = Options(headers: {'Cookie': cookie});
      final response = await _client.get(_url, options: option);
      final cookies = await _cookieJar.loadForRequest(Uri.parse(_url));
      ref.read(cookieProvider.notifier).saveCookieList(cookies);
      debugPrint('response reset pin================>$response');
      if (response.statusCode == 200) {
        return ResetPinAuthorizeModel.fromJson(response.data);
      } else {
        throw UnimplementedError();
      }
    } catch (e) {
      debugPrint('error=====>${e.toString()}');
      if (e is DioException) {
        if (e.error == DioExceptionType.connectionTimeout) {
          throw UnimplementedError();
        } else if (e.response!.statusCode == 401) {
          return LegacyLoginModel.fromJson(e.response!.data);
        } else {
          throw UnimplementedError();
        }
      } else {
        throw UnimplementedError();
      }
    }
  }
}
