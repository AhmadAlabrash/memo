import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/send_money/payment_preview_screen_widget.dart';

class PaymentPreviewMobileScreen extends StatelessWidget {
  const PaymentPreviewMobileScreen({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      appBar: PrimaryAppBar(
        backgroundColor:CustomColor.primaryLightColor,
        Strings.paymentPreview,
        color: CustomColor.whiteColor,
        iconBgColor: CustomColor.whiteColor.withValues(alpha:0.2),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return PaymentPreviewScreenWidget();
  }
}
