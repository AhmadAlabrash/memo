import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_up/email_otp_verification_widget.dart';

class EmailOtpVerificationTabScreenLayout extends StatelessWidget {
  const EmailOtpVerificationTabScreenLayout({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: CustomColor.whiteColor,
      //   leading: Padding(
      //     padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.3),
      //     child: BackButtonWidget(onTap: () {
      //       Get.back();
      //     }),
      //   ),
      // ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: BackButtonWidget(onTap: () {
            Get.back();
          }),
        ),
        Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                horizontal: Dimensions.marginSizeHorizontal * 2.4,
                vertical: Dimensions.marginSizeVertical),
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius),
              color: CustomColor.inputFillLightTextColor,
            ),
            child: EmailOtpWidget())
      ],
    );
  }
}
