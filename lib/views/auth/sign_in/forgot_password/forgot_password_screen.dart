


import '../../../../controller/auth/sign_in/forgot_password_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'forgot_password_tab_screen.dart';
import 'forgot_password_mobile_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: ForgotPasswordTabScreen(controller: controller,

      ),
      mobileScaffold: ForgotPasswordMobileScreen(
        controller: controller,
      ),
    );
  }
}
