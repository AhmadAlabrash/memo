import '../../../backend/model/auth/forgot_password_model.dart';
import '../../../backend/services/auth/auth_api_services.dart';
import '../../../backend/utils/api_method.dart';
import '../../../utils/basic_screen_imports.dart';
import 'otp_verification_controller.dart';

class ForgotPasswordController extends GetxController {
  final emailAddressController = TextEditingController();
  get gotoOtpScreen => forgotPasswordProcess();
  RxString userToken = ''.obs;

  /// >> set loading process & Forgot Password Model
  final _isForgotPasswordLoading = false.obs;
  late ForgotPasswordModel _forgotPasswordModel;

  /// >> get loading process & Forgot Password Model
  bool get isForgotPasswordLoading => _isForgotPasswordLoading.value;
  ForgotPasswordModel get forgotPasswordModel => _forgotPasswordModel;

  ///* Forgot Password Api Process
  Future<ForgotPasswordModel> forgotPasswordProcess() async {
    _isForgotPasswordLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'credentials': emailAddressController.text.trim(),
    };
    await AuthApiServices.forgotPasswordProcessApi(body: inputBody)
        .then((value) {
      _forgotPasswordModel = value!;
      goToEmailVerification(_forgotPasswordModel.data.token);
      _isForgotPasswordLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isForgotPasswordLoading.value = false;
    update();
    return _forgotPasswordModel;
  }

  final controller = Get.put(OtpVerificationController());
  void goToEmailVerification(String token) {
    controller.userToken.value = token;
    debugPrint("\u001b[38;5;208____${controller.userToken.value}\u001b[0m____");
    Get.toNamed(Routes.otpVerificationScreen);
  }
}
