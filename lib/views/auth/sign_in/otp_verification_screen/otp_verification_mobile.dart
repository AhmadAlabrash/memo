
import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_in/otp_verification_widget.dart';

class OtpVerificationMobileScreenLayout extends StatelessWidget {
  const OtpVerificationMobileScreenLayout({
    super.key,

  });
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.whiteColor,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize * 0.22),
          child: BackButtonWidget(onTap: () {
            Get.back();
          }),
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return OtpVerificationWidget();
  }
}
