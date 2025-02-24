import '../utils/basic_widget_imports.dart';
import '../views/auth/sign_in /forgot_password/forgot_password_screen.dart';
import '../views/auth/sign_in /otp_verification_screen/otp_verification_screen.dart';
import '../views/auth/sign_in /reset_password_screen/reset_password_screen.dart';
import '../views/auth/sign_in /sign_in_screens/sign_in_screen.dart';
import '../views/auth/sign_up/email_otp_screens/email_otp_verification_screen.dart';
import '../views/auth/sign_up/sign_up_screen/sign_up_screen.dart';
import '../views/drawer/change_password_screen.dart';
import '../views/drawer/notificaton/notification_screen.dart';
import '../views/navigation/navigation_screen.dart';
import '../views/send_money/payment_preview/payment_preview_screen.dart';
import '../views/send_money/payment_proof/payment_proof_screen.dart';
import '../views/send_money/receiving_method/receiving_method_screen.dart';
import '../views/send_money/tatum/tatum_screen.dart';
import '../views/send_money/web_view.dart';
import '../views/splash_screen/splash_screen.dart';
import '../views/tracking/go_to_tracking/go_to_track_screen.dart';
import '../views/tracking/tracking_screen/tracking_screen.dart';
import '../views/two_fa/two_fa_otp/two_fa_otp_verification.dart';
import '../views/two_fa/two_fa_screen.dart';
import '/routes/routes.dart';
import '/views/onboard/onboard_screen.dart';
import '../bindings/splash_screen_binding.dart';

class RoutePageList {
  static var list = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboardScreen,
      page: () => OnboardScreen(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => const SignInScreen(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotPasswordScreen(),
    ),
    GetPage(
      name: Routes.otpVerificationScreen,
      page: () => const OtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: Routes.emailOtpVerificationScreen,
      page: () => const EmailOtpVerificationScreen(),
    ),
    GetPage(
      name: Routes.navigationScreen,
      page: () => NavigationScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.changePasswordScreen,
      page: () => ChangePasswordScreen(),
    ),
    GetPage(
      name: Routes.notificationScreen,
      page: () => NotificationScreen(),
    ),
    GetPage(
      name: Routes.receivingMethodScreen,
      page: () => const ReceivingMethodScreen(),
    ),
    GetPage(
      name: Routes.paymentPreviewScreen,
      page: () => const PaymentPreviewScreen(),
    ),
    GetPage(
      name: Routes.paymentProofScreen,
      page: () => const PaymentProofScreen(),
    ),
    GetPage(
      name: Routes.goToCongratulationScreen,
      page: () => GoToCongratulationScreen(),
    ),
    GetPage(
      name: Routes.trackingScreen,
      page: () => TrackingScreen(),
    ),
    GetPage(
      name: Routes.webViewScreen,
      page: () => const WebPaymentScreen(),
    ),
      GetPage(
      name: Routes.twoFaScreen,
      page: () => const TwoFaScreen(),
    ),
    GetPage(
      name: Routes.twoFaOtpScreen,
      page: () => const TwoFaOtpScreen(),
    ),
    GetPage(
      name: Routes.tatumManualScreen,
      page: () => TatumManualScreen(),
    ),
  ];
}
