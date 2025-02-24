import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/send_money/payment_proof_widget_screen.dart';

class PaymentProofMobileScreen extends StatelessWidget {
  const PaymentProofMobileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      appBar: PrimaryAppBar(
        appBarSize: Dimensions.heightSize * 4.8,
        backgroundColor: CustomColor.primaryLightColor,
        Strings.paymentProof,
        color: CustomColor.whiteColor,
        iconBgColor: CustomColor.whiteColor.withValues(alpha:0.2),
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return PaymentProofScreenWidget();
  }
}
