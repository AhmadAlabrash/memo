import '../../backend/model/basic_settings/onboard_model.dart';
import '../../backend/services/basic_settings/basic_settings_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';

class OnboardController extends GetxController {
  get onGetStarted => _onGetStarted();

  _onGetStarted() {
    Routes.signInScreen.offAllNamed;
    LocalStorages.saveOnboardDoneOrNot(isOnBoardDone: true);
  }

  RxString onboardImage = "".obs;
  RxString onboardImageTab = "".obs;
  RxString title = "".obs;
  RxString titleTab = "".obs;
  RxString subTitle = "".obs;
  RxString subTitleTab = "".obs;
  @override
  void onInit() {
    getOnboardApiProcess();
    super.onInit();
  }

  final _isLoading = false.obs;
  bool get isLoading => _isLoading.value;
  late OnboardModel _onboardModel;
  OnboardModel get onboardModel => _onboardModel;

  Future<OnboardModel> getOnboardApiProcess() async {
    _isLoading.value = true;
    update();
    await BasicSettingsApiServices.onboardProcessApi().then((value) {
      _onboardModel = value!;
      var image = onboardModel.data.onboardScreens.mobile.first.image;
      var imageTab = onboardModel.data.onboardScreens.tab.first.image;
      var baseUrl = onboardModel.data.imagePaths.baseUrl;
      var path = onboardModel.data.imagePaths.pathLocation;
      onboardImage.value = "$baseUrl/$path/$image";
      title.value = onboardModel.data.onboardScreens.mobile.first.title;
      subTitle.value = onboardModel.data.onboardScreens.mobile.first.subTitle;
      //>>> tab get
      onboardImageTab.value = "$baseUrl/$path/$imageTab";
      titleTab.value = onboardModel.data.onboardScreens.tab.first.title;
      subTitleTab.value = onboardModel.data.onboardScreens.tab.first.subTitle;
      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
      _isLoading.value = false;
    });
    _isLoading.value = false;
    update();
    return _onboardModel;
  }
}
