import '/backend/utils/custom_loading_api.dart';
import '/controller/send_money/payment_gateway_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/payment_information_widget.dart';
import '../text_labels/title_heading5_widget.dart';

class PaymentPreviewScreenWidget extends StatelessWidget {
  PaymentPreviewScreenWidget({super.key});

  final controller = Get.put(PaymentGatewayController());

  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: height,
        width: width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            verticalSpace(isTab() ? 0 : Dimensions.heightSize * 5),
            _topContainer(
              context,
            ),
            BottomContainerWidget(
              context,
              height: isTab() ? height * 0.56 : height * 0.80,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  _detailsWidget(context),
                  _buttonWidget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _topContainer(
    BuildContext context,
  ) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isTab()
            ? Dimensions.paddingSizeVertical
            : Dimensions.paddingSizeVertical * 1.5,
        horizontal: Dimensions.paddingSizeHorizontal * 0.7,
      ),
      margin: EdgeInsets.only(
          left: Dimensions.marginSizeHorizontal * 1.3,
          right: Dimensions.marginSizeHorizontal * 1.3,
          bottom: Dimensions.marginSizeVertical * 0.7),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 1.5),
      ),
      child: Column(mainAxisAlignment: mainCenter, children: [
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TitleHeading4Widget(
              text: controller.senderGateway,
              fontSize: isTab()
                  ? Dimensions.headingTextSize2
                  : Dimensions.headingTextSize5,
              color: CustomColor.primaryLightTextColor,
            ),
            horizontalSpace(Dimensions.widthSize * 0.2),
            TitleHeading4Widget(
              text: controller.receiverGateway,
              fontSize: isTab()
                  ? Dimensions.headingTextSize2
                  : Dimensions.headingTextSize5,
              color: CustomColor.primaryLightTextColor,
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.1),
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            //sender currency
            Row(
              children: [
                TitleHeading3Widget(
                    fontSize: isTab()
                        ? Dimensions.headingTextSize3 * 2
                        : Dimensions.headingTextSize3 * 1.1,
                    text: double.parse(
                      controller.senderAmount,
                    ).toStringAsFixed(2)),
                TitleHeading3Widget(
                  fontSize: isTab()
                      ? Dimensions.headingTextSize3 * 2
                      : Dimensions.headingTextSize3 * 1.1,
                  text: controller.senderCurrencyCode,
                  color: CustomColor.secondaryLightColor,
                ),
              ],
            ),
            //receiver currency
            Row(
              children: [
                TitleHeading3Widget(
                    fontSize: isTab()
                        ? Dimensions.headingTextSize3 * 2
                        : Dimensions.headingTextSize3 * 1.1,
                    text: double.parse(controller.receiverAmount)
                        .toStringAsFixed(2)),
                horizontalSpace(Dimensions.widthSize * 0.2),
                TitleHeading3Widget(
                  fontSize: isTab()
                      ? Dimensions.headingTextSize3 * 2
                      : Dimensions.headingTextSize3 * 1.1,
                  text: controller.receiverCurrencyCode,
                  color: CustomColor.secondaryLightColor,
                ),
              ],
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.1),
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            TitleHeading5Widget(
              text: Strings.sending,
              color: CustomColor.secondaryLightTextColor,
              fontSize: isTab()
                  ? Dimensions.headingTextSize2
                  : Dimensions.headingTextSize6,
            ),
            TitleHeading5Widget(
              text: Strings.receiving,
              color: CustomColor.secondaryLightTextColor,
              fontSize: isTab()
                  ? Dimensions.headingTextSize2
                  : Dimensions.headingTextSize6,
            ),
          ],
        ),
      ]),
    );
  }

  _detailsWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    var data = controller.insertReceivingInfoModel.data;
    return Column(
      children: [
        Column(
          children: List.generate(
            data.receivingInfo.length,
            (index) => PaymentInformationWidget(
              variable: data.receivingInfo[index].label,
              value: data.receivingInfo[index].value,
            ),
          ),
        ),
        Column(
          children: [
            PaymentInformationWidget(
              variable: Strings.sendingMethod,
              value: data.sendingMethod,
            ),
            PaymentInformationWidget(
              variable: Strings.receivingMethod,
              value: data.receivingMethod,
            ),
            PaymentInformationWidget(
              variable: Strings.exchangeRate,
              value:
                  "1 ${data.senderCurrency} = ${double.parse(data.exchangeRate).toStringAsFixed(2)} ${data.receiverCurrency} ",
            ),
            PaymentInformationWidget(
              variable: Strings.feesCharge,
              value:
                  "${double.parse(data.totalCharge).toStringAsFixed(2)} ${data.senderCurrency}",
              stoke: true,
            ),
            verticalSpace(Dimensions.heightSize * 0.2),
            Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                TitleHeading3Widget(
                  fontSize: isTab()
                      ? Dimensions.headingTextSize1
                      : Dimensions.headingTextSize3,
                  text: Strings.totalPayableAmount,
                ),
                TitleHeading3Widget(
                  fontSize: isTab()
                      ? Dimensions.headingTextSize1
                      : Dimensions.headingTextSize3,
                  text:
                      "${double.parse(data.payable).toStringAsFixed(2)} ${data.senderCurrency}",
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    // final manualController = Get.put(PaymentManualController());
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 0.8),
          child: Obx(
            () => controller.isTatumLoading || controller.isAutomaticLoading
                // manualController.isLoading
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    title: Strings.confirm,
                    onPressed: () {
                      if (controller.senderAlias.contains("automatic")) {
                        if (controller.senderAlias.contains("tatum")) {
                          debugPrint("tatum");
                          controller.tatumProcess();
                        } else {
                          debugPrint("automatic");
                          controller.paymentStripeProcess();
                        }
                      } else {
                        Get.toNamed(Routes.paymentProofScreen);
                      }
                    },
                  ),
          ),
        ),
        verticalSpace(Dimensions.heightSize * 10)
      ],
    );
  }
}
