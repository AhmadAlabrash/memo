import '../../backend/utils/custom_loading_api.dart';
import '../../controller/basic_settings/splash_onboard_controller.dart';
import '../../utils/basic_screen_imports.dart';

class TabSplashScreen extends StatelessWidget {
  TabSplashScreen({super.key});
  final controller = Get.put(SplashOnboardController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : Stack(
                  children: [
                    Image.network(
                      controller.splashTabImage.value,
                      fit: BoxFit.cover,
                      height: MediaQuery.sizeOf(context).height,
                      width: MediaQuery.sizeOf(context).width,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
