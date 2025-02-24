
import '../../../../utils/basic_widget_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'email_otp_mobile_screen.dart';
import 'email_otp_tab_screen.dart';

class EmailOtpVerificationScreen extends StatelessWidget {
  const EmailOtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
  tabletScaffold: EmailOtpVerificationTabScreenLayout(),
      mobileScaffold: EmailOtpVerificationMobileScreenLayout(
      ),
    );
  }
}
