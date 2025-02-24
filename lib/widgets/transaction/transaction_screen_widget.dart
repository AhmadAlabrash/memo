import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:moneymove/controller/send_money/payment_gateway_controller.dart';
import '/controller/navigation/transaction_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../navigation/transaction_log_widget.dart';
import '../others/animation_custom_view.dart';

class TransactionScreenWidget extends StatelessWidget {
  TransactionScreenWidget({super.key});
  final controller = Get.put(TransactionController());
  final paymentController = Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    var data = controller.transactionModel.data.transactions;
    return AnimationLimiter(
      child: controller.transactionModel.data.transactions.isEmpty
          ? const Center(
              child: TitleHeading3Widget(text: Strings.noNotificationFound))
          : ListView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: List.generate(
                data.length,
                (index) => CustomListViewAnimation(
                  index: index,
                  child: GestureDetector(
                    onTap: () {
                      LocalStorages.saveTrackingTrx(
                          trx: controller
                              .transactionModel.data.transactions[index].trxId);
                      paymentController.pdfTrxString.value = controller
                          .transactionModel.data.transactions[index].trxId;
                      Get.toNamed(Routes.trackingScreen);
                    },
                    child: TransactionWidget(
                      data:
                          controller.transactionModel.data.transactions[index],
                    ),
                  ),
                ),
              ),
            ),
    ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.8);
  }
}
