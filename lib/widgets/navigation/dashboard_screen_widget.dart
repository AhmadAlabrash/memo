import '/backend/utils/custom_loading_api.dart';
import '/controller/send_money/payment_gateway_controller.dart';

import '../../controller/navigation/dashboard_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../inputs/receiver_input_field.dart';
import '../inputs/sender_input_field.dart';
import '../text_labels/title_heading5_widget.dart';

class DashboardScreenWidget extends StatelessWidget {
  DashboardScreenWidget({super.key});
  final controller = Get.put(DashboardController());
  final paymentController = Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return controller.isLoading || paymentController.isLoading
        ? CustomLoadingAPI(
            color: CustomColor.secondaryLightColor,
            )
        : BottomContainerWidget(
            context,
            height: isTab()
                ? MediaQuery.sizeOf(context).height * 0.62
                : MediaQuery.sizeOf(context).height * 0.95,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SenderInputWidget(),
                verticalSpace(Dimensions.heightSize),
                ReceiverInputWidget(),
                _limitWidget(context),
                _buttonWidget(context),
              ],
            ),
          );
  }

  _limitWidget(BuildContext context) {
    var c = paymentController;
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 1.2),
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeHorizontal * 0.8,
        vertical: Dimensions.paddingSizeVertical * 0.7,
      ),
      decoration: BoxDecoration(
          color: CustomColor.secondaryLightColor,
          borderRadius: BorderRadius.circular(Dimensions.radius)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Expanded(
                child: TitleHeading4Widget(
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize1
                        : Dimensions.headingTextSize4,
                    color: CustomColor.whiteColor,
                    text: Strings.exchangeRate),
              ),
              Expanded(
                child: TitleHeading4Widget(
                  textAlign: TextAlign.right,
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize1
                        : Dimensions.headingTextSize4,
                    color: CustomColor.whiteColor,
                    text: Strings.transferLimitation),
              ),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 0.5),
          Obx(
            () => Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                Expanded(
                  child: TitleHeading5Widget(
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: isTab()
                          ? Dimensions.headingTextSize3
                          : Dimensions.headingTextSize6,
                      color: CustomColor.whiteColor,
                      text:
                          "1 ${c.senderCurrency.value} = ${double.parse(c.exchangeRate.value.toString()).toStringAsFixed(2)} ${c.receiverCurrency.value}"),
                ),
                Expanded(
                  child: TitleHeading5Widget(
                      textAlign: TextAlign.right,
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      color: CustomColor.whiteColor,
                      fontSize: isTab()
                          ? Dimensions.headingTextSize3
                          : Dimensions.headingTextSize6,
                      text:
                          "${double.parse(c.minLimit.value.toString()).toStringAsFixed(2)} = ${double.parse(c.maxLimit.value.toString()).toStringAsFixed(2)} ${c.senderCurrency.value}"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 0.9),
      child: Obx(
        () => paymentController.isTransferLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.continues,
                onPressed: () {
                  paymentController.onContinues;
                }),
      ),
    );
  }
}
