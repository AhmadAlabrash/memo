import '../../../backend/model/auth/sign_up_model.dart';
import '../../../backend/services/auth/auth_api_services.dart';
import '../../../backend/utils/api_method.dart';
import '../../../utils/basic_screen_imports.dart';

class SignUpController extends GetxController {
  final emailAddressController = TextEditingController();
  final forgotPasswordEmailAddressController = TextEditingController();
  final passwordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  RxBool agreed = false.obs;

  // get onSignIn => signInProcess();
  get onRegistration => Routes.signInScreen.toNamed;
  get onSignUp => signUpProcessApi();

  /// >> set loading process & Sign Up Model
  final _isLoading = false.obs;
  late SignUpModel _signUpModel;

  /// >> get loading process & Sign Up Model
  bool get isLoading => _isLoading.value;
  SignUpModel get signUpModel => _signUpModel;

  ///* Sign Up Process Api
  Future<SignUpModel> signUpProcessApi() async {
    _isLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'email': emailAddressController.text,
      'password': passwordController.text.trim(),
      'agree': '1',
    };
    await AuthApiServices.signUpProcessApi(body: inputBody).then((value) {
      _signUpModel = value!;
      _goToSavedUser(signUpModel);
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _signUpModel;
  }

  void _goToSavedUser(SignUpModel signUpModel) {
    LocalStorages.saveToken(token: signUpModel.data.token);
    LocalStorages.saveEmailToken(emailToken: signUpModel.data.authorization.token);
    LocalStorages.saveIsSmsVerify(
        value: signUpModel.data.userInfo.emailVerified == 0 ? false : true);

    if (signUpModel.data.userInfo.emailVerified == 0) {
      Get.offNamed(Routes.emailOtpVerificationScreen);
    } else {
      LocalStorages.isLoginSuccess(isLoggedIn: true);
      LocalStorages.saveId(id: signUpModel.data.userInfo.id);
      Get.offNamedUntil(Routes.navigationScreen, (route) => false);
    }
  }
}
