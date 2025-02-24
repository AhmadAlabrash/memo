import '../../../controller/drawer/notification_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'notification_mobile_screen.dart';
import 'notification_tab_screen.dart';
class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final controller = Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: NotificationTabScreenLayout(
        controller: controller,
      ),
      mobileScaffold: NotificationMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
