import '/language/language_controller.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../controller/auth/sign_in/sign_in_controller.dart';
import '../../../controller/basic_settings/biometric_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../inputs/primary_text_input_area_widget.dart';


class SignInWidget extends StatelessWidget {
  SignInWidget({super.key});
  final controller = Get.put(SignInController());
  final biometric = Get.put(BiometricController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: height,
        width: width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            _appNameWidget(context),
            BottomContainerWidget(
              context,
              height: isTab()
                  ? MediaQuery.sizeOf(context).height * 0.53
                  : MediaQuery.sizeOf(context).height * 0.78,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _titleSubtitleWidget(context),
                  _inputWidget(context),
                  _rememberAndForgotWidget(context),
                  _buttonWidget(context),
                  _doNotHaveAnAccount(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appNameWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      height: isTab()
          ? MediaQuery.sizeOf(context).height * 0.29
          : MediaQuery.sizeOf(context).height * 0.3,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical),
      child: CustomTitleHeadingWidget(
        text: Strings.appName,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: isTab()
              ? Dimensions.headingTextSize2 * 3
              : Dimensions.headingTextSize2 * 2,
          color: CustomColor.whiteColor,
        ),
      ),
    );
  }

  _titleSubtitleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.7),
      child: const TitleSubTitleWidget(
        title: Strings.logInAndStayConnected,
        subTitle: Strings.ourSecureLoginProcessEnsuresThe,
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(children: [
        PrimaryInputWidget(
            controller: controller.emailAddressController,
            hintText: Strings.enterEmailAddress,
            label: Strings.enterAddress),
        verticalSpace(Dimensions.heightSize),
        PrimaryInputWidget(
          controller: controller.passwordController,
          hintText: Strings.enterPassword,
          label: Strings.password,
          isPasswordField: true,
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
      ]),
    );
  }

  _rememberAndForgotWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return 
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
          
            onTap: () {
              controller.onForgotPassword;
            },
            child: CustomTitleHeadingWidget(
              text: Strings.forgotPasswordQuestion.tr,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle.copyWith(
                      color: CustomColor.primaryDarkColor,
                      fontSize: isTab()
                          ? Dimensions.headingTextSize3
                          : Dimensions.headingTextSize5,
                      fontWeight: FontWeight.w600)
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                      color: CustomColor.secondaryLightColor,
                      fontSize: isTab()
                          ? Dimensions.headingTextSize3
                          : Dimensions.headingTextSize5,
                      fontWeight: FontWeight.w600),
            ),
          
              ),
        );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: Dimensions.marginSizeVertical * 1.3,
        bottom: Dimensions.marginSizeVertical * 0.4,
      ),
      child: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : Column(
                children: [
                  PrimaryButton(
                    title: Strings.loginNow,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.onSignIn;
                      }
                    },
                  ),
                  verticalSpace(Dimensions.marginBetweenInputTitleAndBox * 2),
                  Visibility(
                    visible: biometric.supportState == SupportState.supported &&
                        LocalStorages.isLoggedIn(),
                    child: PrimaryButton(
                      title: Strings.signInWithTouchId,
                      onPressed: () async {
                        bool isAuthenticated =
                            await Authentication.authenticateWithBiometrics();

                        if (isAuthenticated) {
                          Get.offAndToNamed(Routes.navigationScreen);
                        } else {
                          debugPrint('isAuthenticated : false');
                        }
                      },
                      buttonTextColor: Theme.of(context).primaryColor,
                      buttonColor: Colors.transparent,
                      elevation: 0,
                      borderColor: Theme.of(context).primaryColor,
                      borderWidth: 1.5,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  _doNotHaveAnAccount(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final lController = Get.put(LanguageController());
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: lController.getTranslation(Strings.donHaveAnAccount),
          style: Get.isDarkMode
              ? GoogleFonts.inter(
                  color: CustomColor.deActiveColorColor,
                  fontSize: isTab()
                      ? Dimensions.headingTextSize6
                      : Dimensions.headingTextSize5,
                )
              : GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: CustomColor.deActiveColorColor,
                  fontSize:
                      isTab() ? 6.sp : Dimensions.headingTextSize5 * 0.97),
          children: [
            WidgetSpan(
                child: SizedBox(
              width: Dimensions.widthSize * 0.4,
            )),
            TextSpan(
              text: lController.getTranslation(Strings.registerNow),
              style: Get.isDarkMode
                  ? GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: isTab()
                          ? Dimensions.headingTextSize6
                          : Dimensions.headingTextSize5,
                      color: CustomColor.secondaryLightColor)
                  : GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: isTab() ? 6.sp : Dimensions.headingTextSize5,
                      color: CustomColor.secondaryLightColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.onSignUp;
                },
            )
          ],
        ),
      ),
    );
  }
}
