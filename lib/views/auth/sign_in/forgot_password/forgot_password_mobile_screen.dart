import '../../../../controller/auth/sign_in/forgot_password_controller.dart';
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_in/forgot_password_widget.dart';

class ForgotPasswordMobileScreen extends StatelessWidget {
  const ForgotPasswordMobileScreen({
    super.key,
    required this.controller,
     });
  final ForgotPasswordController controller;
  @override              
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        backgroundColor: CustomColor.whiteColor,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.2),
          child: BackButtonWidget(onTap: () {
            Get.back();
          }),
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ForgotPasswordWidget();
  }
}
