import '/backend/utils/custom_loading_api.dart';
import '../../controller/send_money/payment_gateway_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../text_labels/title_heading5_widget.dart';

class ReceivingMethodWidget extends StatelessWidget {
  ReceivingMethodWidget({super.key});


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
            _topContainer(context),
            BottomContainerWidget(
              context,
              height: isTab() ? height * 0.6 : height * 0.78,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ...controller.inputFields.map((element) {
                    return element;
                  }),
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
                    text: double.parse(controller.senderAmount)
                        .toStringAsFixed(2)),
                         horizontalSpace(Dimensions.widthSize * 0.2),
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
                        horizontalSpace(Dimensions.widthSize*0.2),
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


  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              bottom: Dimensions.marginSizeVertical * 2,
              top: Dimensions.marginSizeVertical * 0.7),
          child: Obx(
            () => controller.isInsertLoading 
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    title: Strings.continues,
                    onPressed: () {
                      controller.onInsertContinue;
                    },
                  ),
          ),
        ),
        verticalSpace(Dimensions.heightSize * 5)
      ],
    );
  }
}
