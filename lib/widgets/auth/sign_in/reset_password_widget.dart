import '/backend/utils/custom_loading_api.dart';
import '/controller/auth/sign_in/reset_password_controller.dart';

import '../../../utils/basic_screen_imports.dart';
import '../../inputs/primary_text_input_area_widget.dart';

class ResetPasswordWidget extends StatelessWidget {
  ResetPasswordWidget({super.key});
  final controller = Get.put(ResetPasswordController());
  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
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
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      alignment: isTab() ? Alignment.center : Alignment.centerLeft,
      width: isTab()
          ? MediaQuery.sizeOf(context).width * 0.4
          : MediaQuery.sizeOf(context).width * 0.62,
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.7),
      child: Image.asset(Assets.logo.basicLogoWhite.path),
    );
  }

  _titleSubtileWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return TitleSubTitleWidget(
        isCenterText: isTab() ? true : false,
        title: Strings.resetPassword,
        subTitle: Strings.resetYourPasswordSignAgain);
  }

  _inputFieldWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.8),
      child: Form(
        key: fromKey,
        child: Column(
          children: [
            PrimaryInputWidget(
                isPasswordField: true,
                fillColor: isTab()
                    ? CustomColor.whiteColor
                    : CustomColor.inputFillLightTextColor,
                controller: controller.newPasswordController,
                hintText: Strings.enterNewPassword,
                label: Strings.newPassword),
            verticalSpace(Dimensions.heightSize),
            PrimaryInputWidget(
              isPasswordField: true,
              fillColor: isTab()
                  ? CustomColor.whiteColor
                  : CustomColor.inputFillLightTextColor,
              controller: controller.confirmPasswordController,
              hintText: Strings.enterConfirmPassword,
              label: Strings.confirmPassword,
            ),
          ],
        ),
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Obx(
      () => controller.isLoading
          ? const CustomLoadingAPI()
          : PrimaryButton(
              title: Strings.resetPassword,
              onPressed: () {
                if (fromKey.currentState!.validate()) {
                  controller.onResetPassword;
                }
              }),
    );
  }
}
