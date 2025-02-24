import '../../../backend/local_storage/local_storage.dart';
import '../../../backend/model/auth/sign_in_model.dart';
import '../../../backend/services/auth/auth_api_services.dart';
import '../../../backend/utils/api_method.dart';
import '/extensions/custom_extensions.dart';

import '../../../routes/routes.dart';
import '../../../utils/basic_widget_imports.dart';

class SignInController extends GetxController {
  final emailAddressController = TextEditingController();
  final forgotPasswordEmailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool rememberMe = true.obs;

  get onSignIn => signInProcess();
  get onForgotPassword => Routes.forgotPasswordScreen.toNamed;
  get onSignUp => Routes.signUpScreen.toNamed;

  /// >> set loading process & Sign In Model
  final _isLoading = false.obs;
  late SignInModel _signInModel;

  /// >> get loading process & Sign In Model
  bool get isLoading => _isLoading.value;
  SignInModel get signInModel => _signInModel;

  ///* Sign in process
  Future<SignInModel> signInProcess() async {
    _isLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'credentials': emailAddressController.text,
      'password': passwordController.text,
    };

    await AuthApiServices.signInProcessApi(body: inputBody).then((value) {
      _signInModel = value!;
      _saveDataLocalStorage();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _signInModel;
  }

  _saveDataLocalStorage() {
    LocalStorages.saveIsSmsVerify(
        value: _signInModel.data.userInfo.emailVerified == 0 ? false : true);
    LocalStorages.saveTwoFaID(
        id: _signInModel.data.userInfo.twoFactorVerified == 0 ? false : true);
    // LocalStorage.saveKyc(
    //     id: _signInModel.data.userInfo. == 1 ? true : false);
    if (_signInModel.data.userInfo.twoFactorStatus == 1 &&
        _signInModel.data.userInfo.twoFactorVerified == 0) {
      LocalStorages.saveToken(token: signInModel.data.token);
      LocalStorages.saveEmail(email: signInModel.data.userInfo.email);
      LocalStorages.saveId(id: signInModel.data.userInfo.id);
      Get.toNamed(Routes.twoFaOtpScreen);
      debugPrint("two fa screen");
    } else if (_signInModel.data.userInfo.emailVerified == 1) {
      debugPrint("----------------VERIFIED");
      _goToSavedUser(signInModel);
    } else if (_signInModel.data.userInfo.emailVerified == 0) {
      debugPrint("----------------EMAIL NOT VERIFIED");
      LocalStorages.saveToken(token: signInModel.data.token);
      LocalStorages.saveEmailToken(
          emailToken: signInModel.data.authorization.token);
      LocalStorages.saveId(id: signInModel.data.userInfo.id);
      Get.toNamed(Routes.emailOtpVerificationScreen);
    }
  }

  void _goToSavedUser(SignInModel signInModel) {
    LocalStorages.saveToken(token: signInModel.data.token);
    if (rememberMe.value) {
      LocalStorages.isLoginSuccess(isLoggedIn: true);
    }
    LocalStorages.saveEmail(email: signInModel.data.userInfo.email);
    LocalStorages.saveId(id: signInModel.data.userInfo.id);
    update();
    Get.offAllNamed(Routes.navigationScreen);
  }
}
