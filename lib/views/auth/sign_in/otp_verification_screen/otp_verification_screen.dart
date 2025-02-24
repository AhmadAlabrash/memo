
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'otp_verification_mobile.dart';
import 'otp_verification_tab_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      tabletScaffold: OtpVerificationTabScreen(

      ),
      mobileScaffold: OtpVerificationMobileScreenLayout(

      ),
    );
  }
}
