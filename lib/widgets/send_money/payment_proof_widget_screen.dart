import '/backend/utils/custom_loading_api.dart';
import '../../controller/send_money/payment_gateway_controller.dart';
import '../../controller/send_money/payment_manual_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/payment_information_widget.dart';

class PaymentProofScreenWidget extends StatelessWidget {
  PaymentProofScreenWidget({super.key});
  final controller = Get.put(PaymentManualController());
  final paymentController = Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Obx(
      () => controller.isLoading
          ? const CustomLoadingAPI()
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: height,
                width: width,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _topContainer(
                      context,
                    ),
                    BottomContainerWidget(
                      context,
                      height: isTab() ? height * 0.45 : height * 0.75,
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
            ),
    );
  }

  _topContainer(BuildContext context) {
    var data = paymentController.insertReceivingInfoModel.data;
    var manualDecs = controller.manualDynamicInputModel.data.gateway.desc;
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.paddingSizeVertical * 0.7,
        horizontal: Dimensions.paddingSizeHorizontal * 0.7,
      ),
      margin: EdgeInsets.only(
        left: isTab()
            ? Dimensions.marginSizeHorizontal * 1.5
            : Dimensions.marginSizeHorizontal,
        right: isTab()
            ? Dimensions.marginSizeHorizontal * 1.5
            : Dimensions.marginSizeHorizontal,
        bottom: Dimensions.marginSizeVertical * 0.7,
      ),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 2),
      ),
      child: Column(crossAxisAlignment: crossStart, children: [
        //>>>>> payment information text
        Container(
            margin: EdgeInsets.only(
                top: Dimensions.marginSizeVertical * 0.45,
                bottom: Dimensions.marginSizeVertical * 0.2),
            child: TitleHeading2Widget(
                fontSize: isTab()
                    ? Dimensions.headingTextSize1
                    : Dimensions.headingTextSize2,
                text: Strings.paymentInformation)),
        Container(
          width: MediaQuery.of(context).size.width,
          color: CustomColor.inputHintLightTextColor,
          child: const DottedDivider(),
        ),
        verticalSpace(Dimensions.heightSize * 0.4),
        //>>>>>>>>>... NB
        Row(
          children: [
            Expanded(
                flex: 2,
                child: TitleHeading4Widget(
                  text: "N.B -",
                  fontWeight: FontWeight.w500,
                  fontSize: isTab()
                      ? Dimensions.headingTextSize3 + 1
                      : Dimensions.headingTextSize4 + 1,
                )),
            Expanded(
              flex: 5,
              child: TitleHeading4Widget(
            fontSize: isTab()
                    ? Dimensions.headingTextSize2
                    : Dimensions.headingTextSize4,
               text: manualDecs,
              ),
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
//>>>>>>>>>>>>>. information details

        Column(
          children: List.generate(
            data.receivingInfo.length,
            (index) => PaymentInformationWidget(
              variable: data.receivingInfo[index].label,
              value: data.receivingInfo[index].value,
            ),
          ),
        ),
      ]),
    );
  }

  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 0.8),
          child: Obx(
            () => controller.isConfirmLoading
                ? const CustomLoadingAPI()
                : PrimaryButton(
                    title: Strings.submit,
                    onPressed: () {
                      controller.onContinues;
                    },
                  ),
          ),
        ),
        verticalSpace(Dimensions.heightSize * 8)
      ],
    );
  }
}
