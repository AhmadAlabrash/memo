import '../../controller/basic_settings/splash_onboard_controller.dart';
import '/backend/utils/custom_loading_api.dart';

import '/utils/basic_widget_imports.dart';

class SplashMobileScreen extends StatelessWidget {
  SplashMobileScreen({super.key});
  final controller = Get.put(SplashOnboardController());
  @override 
  Widget build(BuildContext context) {
    return SafeArea(


      child: Scaffold(
        backgroundColor: CustomColor.primaryLightColor,
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : Image.network(
                  controller.splashImage.value,
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                ),
        ),
      ),
    );
  }
}
