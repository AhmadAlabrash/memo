import '../../controller/basic_settings/onboard_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../utils/responsive_layout.dart';
import 'onboard_mobile_screen.dart';
import 'onboard_tablet_screen.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final controller = Get.put(OnboardController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: OnboardTabletScreenLayout(controller: controller),
      mobileScaffold: OnboardMobileScreenLayout(controller: controller),
    );
  }
}
