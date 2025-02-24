import 'package:moneymove/utils/basic_screen_imports.dart';
import 'navigator_plug.dart';

class SplashController extends GetxController {
  final navigatorPlug = NavigatorPlug();

  @override
  void onReady() {
    super.onReady();
    navigatorPlug.startListening(
      seconds: 3,
      onChanged: () {
        LocalStorages.isLoggedIn()
            ? Get.offAndToNamed(Routes.signInScreen)
            : Get.offAndToNamed(
                LocalStorages.isOnBoardDone()
                    ? Routes.signInScreen
                    : Routes.onboardScreen,
              );
      },
    );
  }
 
 
  @override
  void onClose() {
    navigatorPlug.stopListening();
    super.onClose();
  }
}
