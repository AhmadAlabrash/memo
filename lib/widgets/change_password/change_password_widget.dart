import '/backend/utils/custom_loading_api.dart';

import '../../controller/drawer/change_password_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../inputs/primary_text_input_area_widget.dart';

class ChangePasswordScreenWidget extends StatelessWidget {
  ChangePasswordScreenWidget({super.key});
  final controller = Get.put(ChangePasswordController());
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 0.9),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            PrimaryInputWidget(
                isPasswordField: true,
                controller: controller.oldPasswordController,
                hintText: Strings.enterOldPassword,
                label: Strings.oldPassword),
            verticalSpace(Dimensions.heightSize),
            PrimaryInputWidget(
                isPasswordField: true,
                controller: controller.newPasswordController,
                hintText: Strings.enterNewPassword,
                label: Strings.newPassword),
            verticalSpace(Dimensions.heightSize),
            PrimaryInputWidget(
                isPasswordField: true,
                controller: controller.confirmPasswordController,
                hintText: Strings.enterConfirmPassword,
                label: Strings.confirmPassword),
            verticalSpace(Dimensions.heightSize * 2),
            Obx(
              () => controller.isLoading
                  ? const CustomLoadingAPI()
                  : PrimaryButton(
                      title: Strings.changePassword,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          controller.onChangePassword;
                        }
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
