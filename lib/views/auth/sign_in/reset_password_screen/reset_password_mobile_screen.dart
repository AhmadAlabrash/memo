import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_in/reset_password_widget.dart';

class ResetPasswordMobileScreenLayout extends StatelessWidget {
  const ResetPasswordMobileScreenLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.whiteColor,
        leading: Padding(
               padding:
              EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.22),
          child: BackButtonWidget(onTap: () {
            Get.back();
          }),
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ResetPasswordWidget();
  }
}
