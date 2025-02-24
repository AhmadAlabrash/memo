import 'package:flutter/gestures.dart';
import '/controller/auth/sign_in/sign_in_controller.dart';
import '../../utils/basic_widget_imports.dart';
import '../buttons/primary_button.dart';
import '../inputs/primary_text_input_area_widget.dart';
import '../others/custom_checkbox.dart';
import '../text_labels/title_subtitle_widget.dart';

class SignInBottomContainerWidget extends StatelessWidget {
   SignInBottomContainerWidget(
     {
    super.key,
  });
  final controller = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    Radius borderRadius = Radius.circular(Dimensions.radius * 3);
    return Container(
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius:
            BorderRadius.only(topLeft: borderRadius, topRight: borderRadius),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withValues(alpha:0.015),
            spreadRadius: 7,
            blurRadius: 5,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      padding: EdgeInsets.all(Dimensions.paddingSize),
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
    );
  }

  _titleSubtitleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.7),
      child: TitleSubTitleWidget(
        title: Strings.logInAndStayConnected,
        subTitle: Strings.ourSecureLoginProcessEnsuresThe,
        subTitleFontSize: Dimensions.headingTextSize5,
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Column(children: [
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
    ]);
  }

  _rememberAndForgotWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        FittedBox(
          child: CheckBoxWidget(
            isChecked: controller.rememberMe,
            onChecked: (value) {
              controller.rememberMe.value = value;
            },
          ),
        ),
        InkWell(
          onTap: () {
            controller.onForgotPassword;
          },
          child: CustomTitleHeadingWidget(
            text: Strings.forgotPasswordQuestion.tr,
            style: Get.isDarkMode
                ? CustomStyle.darkHeading5TextStyle.copyWith(
                    color: CustomColor.primaryDarkColor,
                    fontWeight: FontWeight.w600)
                : CustomStyle.lightHeading5TextStyle.copyWith(
                    color: CustomColor.secondaryLightColor,
                    fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical,
        ),
        child: PrimaryButton(
            title: Strings.loginNow,
            onPressed: () {
              controller.onSignIn;
            }));
  }

  _doNotHaveAnAccount(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        text: TextSpan(
          text: Strings.donHaveAnAccount,
          style: Get.isDarkMode
              ? CustomStyle.darkHeading5TextStyle.copyWith(
                  color: CustomColor.deActiveColorColor,
                )
              : CustomStyle.lightHeading5TextStyle.copyWith(
                  color: CustomColor.deActiveColorColor,
                ),
          children: [
            TextSpan(
              text: Strings.registerNow,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle
                      .copyWith(color: CustomColor.secondaryLightColor)
                  : CustomStyle.lightHeading5TextStyle
                      .copyWith(color: CustomColor.secondaryLightColor),
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
