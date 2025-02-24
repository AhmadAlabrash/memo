import '/backend/utils/custom_loading_api.dart';

import '../../../controller/auth/sign_in/forgot_password_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../inputs/primary_text_input_area_widget.dart';

class ForgotPasswordWidget extends StatelessWidget {
  ForgotPasswordWidget({super.key});
  final controller = Get.put(ForgotPasswordController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.of(context).size.shortestSide >= 650;
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal * 0.8),
      child: Column(
        crossAxisAlignment: isTab() ? crossCenter : crossStart,
        children: [
          _imageWidget(context),
          _titleSubtileWidget(context),
          _inputFieldWidget(context),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _imageWidget(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.62,
      margin: EdgeInsets.only(
          top: Dimensions.marginSizeVertical * 0.8,
          bottom: Dimensions.marginSizeVertical * 0.7),
      child: Image.asset(Assets.logo.basicLogoWhite.path),
    );
  }

  _titleSubtileWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.of(context).size.shortestSide >= 650;
    }

    return TitleSubTitleWidget(
        isCenterText: isTab() ? true : false,
        title: Strings.resetYourForgottenPassword,
        subTitle: Strings.takeControlOfYourAccountByResetting);
  }

  _inputFieldWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.of(context).size.shortestSide >= 650;
    }

    return Form(
      key: formKey,
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.8),
        child: PrimaryInputWidget(
          isFilled: true,
          fillColor: isTab()
              ? CustomColor.whiteColor
              : CustomColor.inputFillLightTextColor,
          controller: controller.emailAddressController,
          hintText: Strings.enterEmailAddress,
          label: Strings.enterAddress,
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => controller.isForgotPasswordLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.forgotPassword,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.gotoOtpScreen;
                }
              }),
    );
  }
}
