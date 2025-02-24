import '../../../controller/navigation/profile_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../utils/responsive_layout.dart';
import 'profile_mobile_screen.dart';
import 'profile_tab_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: ProfileTabScreenLayout(
        controller: controller,
      ),
      mobileScaffold: ProfileMobileScreenLayout(
        controller: controller,
      ),
    );
  }
}
