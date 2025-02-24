import 'package:moneymove/utils/basic_screen_imports.dart';

import '../../backend/model/basic_settings/splash_model.dart';
import '../../backend/services/basic_settings/basic_settings_api_services.dart';
import '../../backend/utils/api_method.dart';

class SplashOnboardController extends GetxController {

  @override
  void onInit() {
    getSplashProcess();
    super.onInit();
  }

  RxString splashImage = "".obs;
  RxString splashTabImage = "".obs;
  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late SplashModel _splashModel;
  SplashModel get splashModel => _splashModel;

  Future<SplashModel> getSplashProcess() async {
    _isLoading.value = true;
    update();
    await BasicSettingsApiServices.splashProcessApi().then((value) {
      _splashModel = value!;
      var image = splashModel.data.splashScreen.mobile.image;
      var imageTab = splashModel.data.splashScreen.tab.image;
      var baseUrl = splashModel.data.imagePaths.baseUrl;
      var path = splashModel.data.imagePaths.pathLocation;
      splashImage.value = "$baseUrl/$path/$image";
      splashTabImage.value = "$baseUrl/$path/$imageTab";
      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _splashModel;
  }
}