import '/controller/basic_settings/basic_settings_controller.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../controller/auth/sign_up/sign_up_controller.dart';
import '../../../language/language_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../inputs/primary_text_input_area_widget.dart';
import '../../others/snackbar.dart';

class SignUpWidget extends StatelessWidget {
  SignUpWidget({super.key});
  final controller = Get.put(SignUpController());
  final privacyPolicy = Get.put(BasicSettingsController());
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
            _appNameWidget(
              context,
              topHeight: isTab() ? height * 0.18 : height * 0.18,
            ),
            BottomContainerWidget(
              context,
              height: isTab() ? height * 0.65 : height * 0.73,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _titleSubtitleWidget(context),
                  _inputWidget(context),
                  _agreedWidget(context),
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

  _appNameWidget(BuildContext context, {required double topHeight}) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      height: topHeight,
      // color: CustomColor.primaryLightColor,
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical),
      child: CustomTitleHeadingWidget(
        text: Strings.appName,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w700,
          fontSize: isTab()
              ? Dimensions.headingTextSize2 * 2.7
              : Dimensions.headingTextSize2 * 2,
          color: CustomColor.whiteColor,
        ),
      ),
    );
  }

  _titleSubtitleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.7),
      child: TitleSubTitleWidget(
        title: Strings.registerForAnAccountToday,
        subTitle: Strings.becomeAPartOfOurCommunityByRegistrationForAn,
        subTitleFontSize: Dimensions.headingTextSize5,
      ),
    );
  }

  _inputWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Form(
      key: formKey,
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: PrimaryInputWidget(
                  controller: controller.firstNameController,
                  hintText: Strings.enterName,
                  label: Strings.firstName),
            ),
            horizontalSpace(Dimensions.widthSize),
            Expanded(
              child: PrimaryInputWidget(
                controller: controller.lastNameController,
                hintText: Strings.enterName,
                label: Strings.lastName,
              ),
            ),
          ],
        ),
        verticalSpace(
            isTab() ? Dimensions.heightSize * 0.9 : Dimensions.heightSize),
        PrimaryInputWidget(
            controller: controller.emailAddressController,
            hintText: Strings.enterEmailAddress,
            label: Strings.enterAddress),
        verticalSpace(
            isTab() ? Dimensions.heightSize * 0.9 : Dimensions.heightSize),
        PrimaryInputWidget(
          controller: controller.passwordController,
          hintText: Strings.enterPassword,
          label: Strings.password,
          isPasswordField: true,
        ),
        verticalSpace(Dimensions.heightSize * 0.4),
      ]),
    );
  }

  _agreedWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final lController = Get.put(LanguageController());
    return Container(
      margin: EdgeInsets.only(top: Dimensions.heightSize * 0.4),
      child: Row(
        children: [
          Obx(
            () => Container(
              height:
                  isTab() ? Dimensions.heightSize : Dimensions.heightSize * 1.2,
              width: isTab()
                  ? Dimensions.widthSize * 1
                  : Dimensions.widthSize * 1.56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * .3),
                color: controller.agreed.value
                    ? CustomColor.secondaryLightColor
                    : CustomColor.whiteColor,
                border: Border.all(
                  width: isTab() ? 2 : 1.4,
                  color: CustomColor.deActiveColorColor,
                ),
              ),
              child: Icon(
                Icons.check,
                size: Dimensions.heightSize,
                color: controller.agreed.value
                    ? CustomColor.whiteColor
                    : Colors.white,
              ),
            ),
          ),
          horizontalSpace(Dimensions.widthSize * 0.3),
          RichText(
            text: TextSpan(
              text: lController.getTranslation(Strings.iHaveAgreedWith),
              style: GoogleFonts.inter(
                color: CustomColor.primaryLightTextColor,
                fontSize: isTab()
                    ? Dimensions.headingTextSize6 - 9
                    : Dimensions.headingTextSize5,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if (controller.agreed.value) {
                    controller.agreed.value = false;
                  } else {
                    controller.agreed.value = true;
                  }
                },
              children: [
                TextSpan(
                  text:
                      lController.getTranslation(Strings.termsUsePrivacyPolicy),
                  style: GoogleFonts.inter(
                    color: CustomColor.secondaryLightColor,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize6 - 9
                        : Dimensions.headingTextSize5,
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      privacyPolicy.onPrivacyAndPolicy;
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical,
      ),
      child: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.registerNow,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (controller.agreed.value) {
                      controller.onSignUp;
                    } else {
                      CustomSnackBar.error(Strings.pleaseAgree.translation);
                    }
                  }
                },
              ),
      ),
    );
  }

  _doNotHaveAnAccount(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final lController = Get.put(LanguageController());
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: RichText(
            text: TextSpan(
              text:lController.getTranslation( Strings.alreadyHaveAnAccount),
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
                      fontSize: isTab() ? 6.sp : Dimensions.headingTextSize5),
              children: [
                    WidgetSpan(
                    child: SizedBox(
                  width: Dimensions.widthSize * 0.3,
                )),
                TextSpan(
                  text:lController.getTranslation( Strings.loginNow),
                  style: Get.isDarkMode
                      ? GoogleFonts.inter(
                          fontSize: isTab()
                              ? Dimensions.headingTextSize6
                              : Dimensions.headingTextSize5,
                          color: CustomColor.secondaryLightColor)
                      : GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize:
                              isTab() ? 6.sp : Dimensions.headingTextSize5,
                          color: CustomColor.secondaryLightColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      controller.onRegistration;
                    },
                )
              ],
            ),
          ),
        ),
        verticalSpace(Dimensions.heightSize * 6)
      ],
    );
  }
}
