class UrlUtils {
  static const String prodUrl =
      "https://nomura-mfa-sit-web.southeastasia.cloudapp.azure.com";

  // static const String stagingUrl =
  //     "https://nomura-mfa-dev.southeastasia.cloudapp.azure.com";

  static const String investCloudUrl =
      "https://nomurapreprodclient.investcloud.com";

  static const String investCloudEndPoint = "Membership/ExtPages/Ilg.ashx";

  static const String authorizeEndPoint = "nevisfido/register-device/authorize";
  static const String initEndPoint = "register-device/init";
  static const String mailProceedEndPoint = "register-device/proceed";
  static const String pwdAuthEndPoint = "inband/mauth/";
  static const String authZEndPoint = "inband/oidc/authz";
  static const String deviceCheckPrimalityEndPont = 'device/list';
  static const String mobileClientAuthEndPoint = '/mobile-client/authenticate/';
  static const String pinResetAuthorizeEndPoint =
      '/nevisfido/reset-pin/authorize/';
}
