import 'dart:async';
import '../../views/drawer/drawer_web_view.dart';
import '/utils/basic_screen_imports.dart';
import '../../backend/model/basic_settings/basic_settings_info_model.dart';
import '../../backend/utils/api_method.dart';
import '../../backend/services/basic_settings/basic_settings_api_services.dart';

class BasicSettingsController extends GetxController {
  RxString appTitle = ''.obs;

  RxString services = ''.obs;
  RxString webJournal = ''.obs;
  RxString helpCenter = ''.obs;
  RxString privacyPolicy = ''.obs;
  RxString aboutUs = ''.obs;
  RxString siteLogo = ''.obs;

  RxBool isVisible = false.obs;
  @override
  void onInit() {
    getBasicSettingsApiProcess();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late BasicSettingsInfoModel _appSettingsModel;
  BasicSettingsInfoModel get appSettingsModel => _appSettingsModel;

  Future<BasicSettingsInfoModel> getBasicSettingsApiProcess() async {
    _isLoading.value = true;
    update();
    await BasicSettingsApiServices.getBasicSettingProcessApi().then((value) {
      _appSettingsModel = value!;

      ///>>> get data
      var data = appSettingsModel.data;
      Strings.appName = data.basicSettings.siteName;
      aboutUs.value = data.webLinks.aboutUs;
      helpCenter.value = data.webLinks.contactUs;
      privacyPolicy.value = data.webLinks.privacyPolicy;
      services.value = data.webLinks.services;
      webJournal.value = data.webLinks.webJournal;
// get images
      var image = _appSettingsModel.data.basicSettings.siteLogo;
      var baseUrl = _appSettingsModel.data.imagePaths.basePath;
      var path = _appSettingsModel.data.imagePaths.pathLocation;
      siteLogo.value = "$baseUrl/$path/$image";

      //get custom color
      CustomColor.secondaryLightColor = HexColor(data.basicSettings.baseColor);
      CustomColor.primaryLightColor =
          HexColor(data.basicSettings.secondaryColor);
      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _appSettingsModel;
  }

  //sign up privacy policy
  get onPrivacyAndPolicy => Get.to(
        () => WebViewScreen(
          title: Strings.privacyPolicy,
          url:privacyPolicy.value,
        ),
      );
}
