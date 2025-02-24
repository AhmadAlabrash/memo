import '../../../../utils/basic_screen_imports.dart';
import '../../../widgets/two_fa/two_fa_otp_verification_widget.dart';

class TwoFaOtpVerificationMobileScreen extends StatelessWidget {
  const TwoFaOtpVerificationMobileScreen({
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
    return TwoFaOtpVerificationWidget();
  }
}
