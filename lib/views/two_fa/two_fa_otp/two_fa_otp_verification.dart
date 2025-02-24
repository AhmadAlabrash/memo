import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'two_fa_otp_mobile.dart';
import 'two_fa_otp_tab.dart';
class TwoFaOtpScreen extends StatelessWidget {
  const TwoFaOtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      tabletScaffold: TwoFaOtpVerificationTabScreen(),
      mobileScaffold: TwoFaOtpVerificationMobileScreen(),
    );
  }
}
