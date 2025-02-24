import '/backend/utils/custom_loading_api.dart';
import '/language/language_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../controller/auth/sign_up/email_otp_controller.dart';
import '../../../utils/basic_screen_imports.dart';

class EmailOtpWidget extends StatelessWidget {
  EmailOtpWidget({super.key});
  final controller = Get.put(EmailOtpVerificationController());
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal * 0.7),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          _imageWidget(context),
          _titleSubtileWidget(context),
          _otpInputWidget(context),
          _timeWidget(context),
          _buttonWidget(context),
          _resendButton(context)
        ],
      ),
    );
  }

  _imageWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      alignment: isTab() ? Alignment.center : Alignment.centerLeft,
      width: isTab()
          ? MediaQuery.sizeOf(context).width * 0.4
          : MediaQuery.sizeOf(context).width * 0.62,
      margin: EdgeInsets.symmetric(
        vertical: Dimensions.marginSizeVertical * 0.7,
      ),
      child: Image.asset(Assets.logo.basicLogoWhite.path),
    );
  }

  _titleSubtileWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return TitleSubTitleWidget(
        isCenterText: isTab() ? true : false,
        title: Strings.oTPVerification,
        subTitleFontSize:
            isTab() ? Dimensions.headingTextSize2 : Dimensions.headingTextSize3,
        subTitle: Strings.pleaseEnterTheCodeWeSentA);
  }

  _buttonWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin: EdgeInsets.only(
          top: isTab() ? 0 : Dimensions.marginSizeVertical * 0.5),
      child: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.submit,
                onPressed: () {
                  if (fromKey.currentState!.validate()) {
                    controller.onSubmit;
                  }
                }),
      ),
    );
  }

  _timeWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Obx(
      () => Padding(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeVertical * 0.8,
        ),
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            Icon(
              Icons.watch_later_outlined,
              size: isTab()
                  ? Dimensions.heightSize * 1.7
                  : Dimensions.heightSize * 1.5,
              color: CustomColor.secondaryLightColor,
            ),
            horizontalSpace(Dimensions.widthSize * 0.5),
            TitleHeading3Widget(
              text: controller.secondsRemaining.value >= 0 &&
                      controller.secondsRemaining.value <= 9
                  ? '00:0${controller.secondsRemaining.value}'
                  : '00:${controller.secondsRemaining.value}',
              fontWeight: FontWeight.w600,
              fontSize: isTab()
                  ? Dimensions.headingTextSize2
                  : Dimensions.headingTextSize4,
            )
          ],
        ),
      ),
    );
  }

  _resendButton(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(top: Dimensions.paddingSizeVertical * 0.8),
        child: Visibility(
          visible: controller.enableResend.value,
          child: Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                controller.resendCode();
              },
              child: const TitleHeading3Widget(text: Strings.resendCode),
            ),
          ),
        ),
      ),
    );
  }

  _otpInputWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Form(
      key: fromKey,
      child: Container(
        padding: EdgeInsets.only(top: Dimensions.paddingSizeVertical * 0.8),
        child: PinCodeTextField(
          errorTextSpace: Dimensions.heightSize*1.9,
          appContext: context,
          backgroundColor: Colors.transparent,
          textStyle: Get.isDarkMode
              ? CustomStyle.darkHeading3TextStyle
              : CustomStyle.lightHeading3TextStyle
                  .copyWith(fontWeight: FontWeight.w500),
          enableActiveFill: true,
          pastedTextStyle: TextStyle(
            color: Colors.orange.shade600,
            fontWeight: FontWeight.bold,
          ),
          length: 6,
          obscureText: false,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          validator: (v) {
            if (v!.length < 3) {
              return  Get.find<LanguageController>().getTranslation(Strings.pleaseFillOutTheField);
            } else {
              return null;
            }
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            fieldHeight: isTab() ? 57 : 52,
            fieldWidth: isTab() ? 61 : 53,
            inactiveColor: Colors.transparent,
            activeColor: Colors.transparent,
            selectedColor: Colors.transparent,
            inactiveFillColor: isTab()
                ? CustomColor.whiteColor
                : CustomColor.inputFillLightTextColor,
            activeFillColor: isTab()
                ? CustomColor.whiteColor
                : CustomColor.inputFillLightTextColor,
            selectedFillColor: isTab()
                ? CustomColor.whiteColor
                : CustomColor.inputFillLightTextColor,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          ),
          cursorColor: CustomColor.blackColor,
          animationDuration: const Duration(milliseconds: 300),
          errorAnimationController: controller.errorController,
          controller: controller.pinCodeController,
          keyboardType: TextInputType.number,
          onCompleted: (v) {},
          onChanged: (value) {
            controller.changeCurrentText(value);
          },
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }
}
