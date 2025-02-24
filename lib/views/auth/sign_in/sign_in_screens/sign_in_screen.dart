import '../../../../utils/basic_screen_imports.dart';
import '../../../../utils/responsive_layout.dart';
import 'sign_in_mobile_screen.dart';
import 'sign_in_tablet_screen.dart';
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      tabletScaffold: SignInTabletScreenLayout(),
      mobileScaffold: SignIndMobileScreenLayout(),
    );
  }
}
