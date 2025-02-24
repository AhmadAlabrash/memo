import 'package:get/get.dart';
import '/routes/routes.dart';

import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/services/auth/auth_api_services.dart';
import '../../../backend/utils/api_method.dart';

class SignOutController extends GetxController {
  get onSignOut => signOutProcess();

  /// >> set loading process & Change Password Model
  final _isLoading = false.obs;
  late CommonSuccessModel _commonSuccessModel;

  /// >> set loading process & Change Password Model
  bool get isLoading => _isLoading.value;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  ///* Reset password process
  Future<CommonSuccessModel> signOutProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {};

    await AuthApiServices.signOutApi(body: inputBody).then((value) {
      _commonSuccessModel = value!;
      Get.offAllNamed(Routes.signInScreen);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _commonSuccessModel;
  }
}
