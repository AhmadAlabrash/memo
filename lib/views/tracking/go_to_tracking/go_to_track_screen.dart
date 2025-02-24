
import '../../../controller/tracking/go_to_tracking_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'go_to_track_mobile_screen.dart';

class GoToCongratulationScreen extends StatelessWidget {
  GoToCongratulationScreen({super.key});

  final controller = Get.put(GoToTrackingController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold:CongratulationScreenMobileScreen(
        controller: controller,
      ) ,
      mobileScaffold: CongratulationScreenMobileScreen(
        controller: controller,
      ),
    );
  }
}
