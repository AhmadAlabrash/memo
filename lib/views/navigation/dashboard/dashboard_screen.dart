
import '../../../controller/navigation/dashboard_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'dashboard_mobile_screen.dart';
import 'dashboard_tab_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: DashboardTabScreen(
        controller: controller,
      ),
      mobileScaffold: DashboardMobileScreen(
        controller: controller,
      ),
    );
  }
}
