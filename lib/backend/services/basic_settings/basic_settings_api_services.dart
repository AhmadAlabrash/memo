import '/backend/model/basic_settings/splash_model.dart';
import '../../model/basic_settings/basic_settings_info_model.dart';
import '../../model/basic_settings/onboard_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';
class BasicSettingsApiServices {
  ///* Basic settings get api process
  static Future<BasicSettingsInfoModel?> getBasicSettingProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.basicSettingsURL,
        code: 200,
      );
      if (mapResponse != null) {
        BasicSettingsInfoModel result =
            BasicSettingsInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Basic settings get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong! in BasicSettingsInfoModel');
      return null;
    }
    return null;
  }
   ///* splash get api process
  static Future<SplashModel?> splashProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.splashURL,
        code: 200,
      );
      if (mapResponse != null) {
        SplashModel result =
            SplashModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from splash process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
   ///* onboard get api process
  static Future<OnboardModel?> onboardProcessApi() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: true).get(
        ApiEndpoint.onboardURL,
        code: 200,
      );
      if (mapResponse != null) {
        OnboardModel result =
            OnboardModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err onboard process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
