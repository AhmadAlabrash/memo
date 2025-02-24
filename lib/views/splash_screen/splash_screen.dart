import '/utils/basic_screen_imports.dart';
import '/utils/responsive_layout.dart';
import 'splash_mobile_screen.dart';
import 'tab_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        tabletScaffold: TabSplashScreen(),
        mobileScaffold: SplashMobileScreen());
  }
}
