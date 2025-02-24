import '../../../../utils/basic_widget_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'sign_up_mobile_screen_layout.dart';
import 'sign_up_tablet_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      tabletScaffold: SignUpTabletScreenLayout(),
      mobileScaffold: SignUpMobileScreenLayout(),
    );
  }
}
