import '/extensions/custom_extensions.dart';

class ApiEndpoint {
  static const String mainDomain = "https://moneymove.appdevs.net";
  static const String baseUrl = "$mainDomain/api/v1";
  //-> Login 
  static String loginURL = '/login'.addBaseURl();
  static String splashURL = '/settings/splash-screen'.addBaseURl();
  static String onboardURL = '/settings/onboard-screens'.addBaseURl();
  static String languagesURL = '/settings/languages'.addBaseURl();
  //-> Forgot Password
  static String forgotPasswordSendOtpURL =
      '/password/forgot/find/user'.addBaseURl();
  static String forgotOtpVerifyURL =
      '/password/forgot/verify/code'.addBaseURl();

  static String resetPasswordURL = '/password/forgot/reset'.addBaseURl();
  //-> Register
  static String registerURL = '/register'.addBaseURl();
  static String registerOtpVerifyURL =
      '/authorize/mail/verify/code'.addBaseURl();
  static String registerOtpResendURL =
      '/authorize/mail/resend/code?token='.addBaseURl();
  static String registerSmsCodeVerifyURL = '/sms/otp/verify'.addBaseURl();
  static String registerSmsCodeResendURL = '/sms/resend/code'.addBaseURl();
  static String logOutURL = '/user/logout'.addBaseURl();

  //-> Profile
  static String profileInfoGetURL = '/user/profile/info'.addBaseURl();
  static String profileUpdateURL = '/user/profile/info/update'.addBaseURl();
  static String passwordUpdateURL =
      '/user/profile/password/update'.addBaseURl();
  static String deleteProfileURL = '/user/profile/delete'.addBaseURl();

  //-> dashboard
  static String dashboardURL = '/user/dashboard'.addBaseURl();

  //-> Buying Transactions
  static String buyingTransactionsURL = '/transactions/buying'.addBaseURl();
  static String basicSettingsURL = '/settings/basic-settings'.addBaseURl();

  ///Currency
  static String currencyListUrl = '/currency/list'.addBaseURl();

  /// Two fa
  static String twoFaGetURL = '/authorize/google/2fa/info'.addBaseURl();
  static String twoFaSubmitURL =
      '/authorize/google/2fa/status/update'.addBaseURl();
  static String twoFaOtoVerifyURL = '/authorize/google/2fa/verify'.addBaseURl();

  /// >> notification
  static String notificationURL = '/user/notifications'.addBaseURl();
  //>>>> transaction and tracking
  static String transactionURL = '/user/transaction/log'.addBaseURl();
  static String downloadPdfURL = '/user/transaction/export/pdf/'.addBaseURl();
  static String trackURL = '/user/transaction/track?trx_id='.addBaseURl();

  ///>>>>>>>> transfer money
  static String paymentGatewayURL =
      '/user/transfer-money/payment-gateways'.addBaseURl();
  static String initialTransferURL =
      '/user/transfer-money/initialize-transfer'.addBaseURl();
  static String insertReceivingURL =
      '/user/transfer-money/receiving/method/submit'.addBaseURl();
  static String submitWithAutomaticGatewayURL =
      '/user/transfer-money/automatic/submit'.addBaseURl();
  static String manualGatewayDynamicInputURL =
      '/user/transfer-money/manual/input-fields?identifier='.addBaseURl();
  static String submitWithManualGatewayURL =
      '/user/transfer-money/manual/submit'.addBaseURl();
}
