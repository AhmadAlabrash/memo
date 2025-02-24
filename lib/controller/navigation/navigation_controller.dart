import '/controller/basic_settings/basic_settings_controller.dart';
import '/utils/basic_screen_imports.dart';
import '../../views/drawer/drawer_web_view.dart';
import '../../views/navigation/dashboard/dashboard_screen.dart';
import '../../views/navigation/profile/profile_screen.dart';
import '../../views/settings_screen_tab/settings_tab_screen.dart';
import '../../views/navigation/transaction_screen.dart';
import 'dashboard_controller.dart';

class NavigationController extends GetxController {
  final controller = Get.put(BasicSettingsController());
  final dashboardController = Get.put(DashboardController());
  RxInt selectedIndex = 1.obs;
  RxInt tabSelectedIndex = 0.obs;
  bool isTablet(BuildContext context) {
    return MediaQuery.sizeOf(context).shortestSide >= 650;
  }

  List page = [
    ProfileScreen(),
    DashboardScreen(),
    TransactionScreen(),
  ];
  List tabPage = [
    DashboardScreen(),
    TransactionScreen(),
    ProfileScreen(),
    SettingsTabScreen(),
  ];
  void selectedPage(int index) {
    selectedIndex.value = index;
  }

  //drawer routes
  get onChangePassword => Routes.changePasswordScreen.toNamed;
  get onServices => Get.to(
        () => WebViewScreen(
          title: Strings.services,
          url: controller.services.value,
        ),
      );
  get onWebJournal => Get.to(
        () => WebViewScreen(
          title: Strings.webJournal,
          url: controller.webJournal.value,
        ),
      );

  get onHelpCenter => Get.to(
        () => WebViewScreen(
          title: Strings.helpCenter,
          url: controller.helpCenter.value,
        ),
      );

  get onAboutUs => Get.to(
        () => WebViewScreen(
          title: Strings.aboutUs,
          url: controller.aboutUs.value,
        ),
      );

  get onPrivacyAndPolicy => Get.to(
        () => WebViewScreen(
          title: Strings.privacyPolicy,
          url: controller.privacyPolicy.value,
        ),
      );
}
