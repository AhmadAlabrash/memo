

import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_in/otp_verification_widget.dart';

class OtpVerificationTabScreen extends StatelessWidget {
   const OtpVerificationTabScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: _bodyWidget(context),
    );
  }
  
  _bodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
           padding: EdgeInsets.only(top: Dimensions.paddingSizeVertical * 0.5),
            child: BackButtonWidget(onTap: () {
              Get.back();
            }),
          ),
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
            child: OtpVerificationWidget()),
      ],
    );
  }
}
