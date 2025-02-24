import '/backend/utils/custom_loading_api.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../controller/two_fa/two_fa_otp_verification_controller.dart';

class TwoFaOtpVerificationWidget extends StatelessWidget {
  TwoFaOtpVerificationWidget({super.key});
  final controller = Get.put(TwoFaOtpVerificationController());
  final formKey = GlobalKey<FormState>();
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
          // _timeWidget(context),
          _buttonWidget(context),
          // _resendButton(context)
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
        subTitle:"");
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
                  if (formKey.currentState!.validate()) {
                    controller.onSubmit;
                  }
                }),
      ),
    );
  }


  _otpInputWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.only(top: Dimensions.paddingSizeVertical * 0.8),
        child: PinCodeTextField(
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
              return Strings.pleaseFillOutTheField;
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
            // controller.changeCurrentText(value);
          },
          beforeTextPaste: (text) {
            return true;
          },
        ),
      ),
    );
  }
}
