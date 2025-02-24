import '../../backend/model/common/common_success_model.dart';
import '../../backend/services/auth/auth_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';

class ChangePasswordController extends GetxController {
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  get onChangePassword => changePasswordProcess();

  /// >> set loading process & Change Password Model
  final _isLoading = false.obs;
  late CommonSuccessModel _changePasswordModel;

  /// >> set loading process & Change Password Model
  bool get isLoading => _isLoading.value;
  CommonSuccessModel get changePasswordModel => _changePasswordModel;

  ///* Reset password process
  Future<CommonSuccessModel> changePasswordProcess() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'password': newPasswordController.text,
      'current_password': oldPasswordController.text,
      'password_confirmation': confirmPasswordController.text
    };

    await AuthApiServices.changePasswordApi(body: inputBody).then((value) {
      _changePasswordModel = value!;
      _clearInputText();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _changePasswordModel;
  }

  _clearInputText() {
    oldPasswordController.text = "";
    newPasswordController.text = "";
    confirmPasswordController.text = "";
  }

}

// class LanguageModel implements DropdownModel {
//   final String id;
//   final String name;

//   LanguageModel({required this.id, required this.name});
  
//   @override
//   String get img => id;
  
//   @override
//   String get title => name;
  
// }
