import 'package:get/get.dart';

import '../../../backend/model/common/common_success_model.dart';
import '../../../backend/services/auth/auth_api_services.dart';
import '../../../backend/utils/api_method.dart';
import '../../../routes/routes.dart';

class DeleteController extends GetxController {
  get onDeletes => deleteProcess();

  /// >> set loading process & delete model
  final _isLoading = false.obs;
  late CommonSuccessModel _commonSuccessModel;

  /// >> set loading process & delete model
  bool get isLoading => _isLoading.value;
  CommonSuccessModel get commonSuccessModel => _commonSuccessModel;

  ///* delete process
  Future<CommonSuccessModel> deleteProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {};

    await AuthApiServices.deleteApi(body: inputBody).then((value) {
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
