import '/backend/utils/custom_loading_api.dart';

import '../../../controller/send_money/payment_gateway_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/send_money/receiving_method_widget_screen.dart';

class ReceivingMethodMobileScreen extends StatelessWidget {
  ReceivingMethodMobileScreen({
    super.key,

  });

  final paymentController = Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      appBar: PrimaryAppBar(
        backgroundColor: CustomColor.primaryLightColor,
        Strings.receivingMethod,
        color: CustomColor.whiteColor,
        iconBgColor: CustomColor.whiteColor.withValues(alpha:0.2),
      ),
      body: Obx(
        () => paymentController.isTransferLoading
            ?  CustomLoadingAPI(
              color: CustomColor.secondaryLightColor,
            )
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return ReceivingMethodWidget();
  }
}
