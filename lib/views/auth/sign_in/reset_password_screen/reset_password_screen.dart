import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'reset_password_mobile_screen.dart';
import 'reset_password_tab_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      tabletScaffold: ResetPasswordTabScreen(),
      mobileScaffold: ResetPasswordMobileScreenLayout(),
    );
  }
}
