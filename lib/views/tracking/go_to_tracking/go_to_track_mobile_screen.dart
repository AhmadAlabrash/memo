import 'package:flutter_svg/flutter_svg.dart';
import 'package:moneymove/controller/send_money/payment_gateway_controller.dart';
import '/backend/utils/custom_loading_api.dart';

import '../../../controller/tracking/go_to_tracking_controller.dart';
import '../../../utils/basic_screen_imports.dart';

class CongratulationScreenMobileScreen extends StatelessWidget {
  CongratulationScreenMobileScreen({
    super.key,
    required this.controller,
  });

  final GoToTrackingController controller;
  final pController = Get.put(PaymentGatewayController());

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      // ignore: deprecated_member_use
      onPopInvoked: (value) async {
        if (value) {
          await Get.offAllNamed(Routes.navigationScreen);
        }
      },
      child: Scaffold(
          body: Obx(
        () => controller.isLoading 
            ? CustomLoadingAPI(
                color: CustomColor.secondaryLightColor,
              )
            : _bodyWidget(context),
      )),
    );
  }

// body widget containing all widget elements
  _bodyWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: isTab() ? Dimensions.marginSizeHorizontal * 3 : 0),
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _congratulationImageWidget(
            context,
          ),
          verticalSpace(Dimensions.heightSize * 2),
          _congratulationInfoWidget(
            context,
          ),
          verticalSpace(Dimensions.heightSize * 1.33),
          _buttonWidget(context),
        ],
      ),
    );
  }

  _buttonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        children: [
          PrimaryButton(
            fontSize: Dimensions.headingTextSize2,
            title: Strings.goToTrace,
            onPressed: () {
              controller.onTraceTap;
            },
          ),
          verticalSpace(Dimensions.heightSize),
          Row(
            mainAxisAlignment: mainSpaceBet,
            children: [
              Expanded(
                child: Obx(
                  () =>  controller.isDownloadLoading
                      ? const CustomLoadingAPI()
                      : PrimaryButton(
                          fontSize: Dimensions.headingTextSize2 - 2,
                          borderColor: CustomColor.secondaryLightColor,
                          buttonTextColor: CustomColor.secondaryLightColor,
                          buttonColor: CustomColor.whiteColor,
                          title: Strings.downloadPDF,
                          onPressed: () {
                            controller.downloadPDF(
                              url: controller.exportPdfModel.data.downloadLink,
                              pdfFileName: 'Information',
                            );
                          }),
                ),
              ),
              horizontalSpace(Dimensions.widthSize),
              Expanded(
                  child: PrimaryButton(
                      fontSize: Dimensions.headingTextSize2,
                      borderColor: CustomColor.secondaryLightColor,
                      buttonTextColor: CustomColor.secondaryLightColor,
                      buttonColor: CustomColor.whiteColor,
                      title: Strings.goToHome,
                      onPressed: () {
                        Get.offAllNamed(Routes.navigationScreen);
                      })),
            ],
          ),
        ],
      ),
    );
  }

  _congratulationImageWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return SvgPicture.asset(
      Assets.clipart.successfull,
      height: isTab() ? 100.h : 150.h,
    );
  }

  _congratulationInfoWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal),
      child: Column(
        children: [
          TitleHeading2Widget(
            text: Strings.congratulations,
            fontSize: isTab()
                ? Dimensions.headingTextSize2 * 2
                : Dimensions.headingTextSize1,
            color: CustomColor.primaryLightTextColor,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
          TitleHeading4Widget(
            padding: EdgeInsets.symmetric(
                horizontal: isTab() ? 0 : Dimensions.paddingSizeHorizontal),
            text: Strings.yourPaymentSuccessfull,
            color: CustomColor.secondaryLightTextColor,
            fontWeight: FontWeight.w500,
            fontSize: isTab()
                ? Dimensions.headingTextSize2
                : Dimensions.headingTextSize5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
