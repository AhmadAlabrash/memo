import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/send_money/payment_preview_screen_widget.dart';

class PaymentPreviewTabScreen extends StatelessWidget {
  const PaymentPreviewTabScreen({super.key,});
 
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      appBar: AppBar(
        surfaceTintColor: CustomColor.whiteColor.withValues(alpha:0.15),
        centerTitle: true,
        leadingWidth: MediaQuery.sizeOf(context).width * 0.1,
        leading: BackButtonWidget(
            iconBgColor: CustomColor.whiteColor.withValues(alpha:0.15),
            onTap: () {
              Get.close(1);
            }),
        toolbarHeight: Dimensions.heightSize * 5,
        backgroundColor: CustomColor.primaryLightColor,
        title: TitleHeading3Widget(
          fontSize: Dimensions.headingTextSize3 * 2,
          color: CustomColor.whiteColor,
          text: Strings.paymentPreview,
        ),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: PaymentPreviewScreenWidget(),
    );
  }
}
