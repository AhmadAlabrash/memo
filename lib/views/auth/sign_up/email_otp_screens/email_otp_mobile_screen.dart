import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_up/email_otp_verification_widget.dart';

class EmailOtpVerificationMobileScreenLayout extends StatelessWidget {
  const EmailOtpVerificationMobileScreenLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.whiteColor,
        leading: Padding(
          padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.3),
          child: BackButtonWidget(onTap: () {
            Get.back();
          }),
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return EmailOtpWidget();
  }
}
