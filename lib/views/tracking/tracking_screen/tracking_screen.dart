
import '../../../controller/tracking/transaction_tracking_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'tracking_mobile_screen.dart';
import 'tracking_tab_screen.dart';


class TrackingScreen extends StatelessWidget {
  TrackingScreen({super.key});

  final controller = Get.put(TrackingController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
       tabletScaffold: TrackingScreenTabScreen(
        controller: controller,
      ),
      mobileScaffold: TrackingScreenMobileScreen(
        controller: controller,
      ),
    );
  }
}
