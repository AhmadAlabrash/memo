import 'package:intl/intl.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../controller/navigation/dashboard_controller.dart';
import '../../controller/tracking/go_to_tracking_controller.dart';
import '../../controller/tracking/transaction_tracking_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/payment_information_widget.dart';
import '../others/tracking_transaction_widget.dart';
import '../tracking/stepper_widget.dart';

class TrackingScreenWidget extends StatelessWidget {
  TrackingScreenWidget({super.key});
  final controller = Get.put(TrackingController());
  final dashboard = Get.put(DashboardController());
  final pdfController = Get.put(GoToTrackingController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SizedBox(
        height: height,
        width: width,
        child:  RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () async {
            controller.trackGetApiProcess();
          },
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              _topContainer(context),
              BottomContainerWidget(
                context,
                height: isTab() ? height * 0.55 : height * 0.88,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    _stepperWidget(context),
                    _buttonWidget(context),
                    
                  ],
                ),
              ),
              verticalSpace(Dimensions.heightSize * 6),
            ],
          ),
        ),
      ),
    );
  }

  _topContainer(BuildContext context) {
    var data = controller.trackModel.data.transaction;
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: Dimensions.marginSizeVertical * 0.4,
          horizontal: Dimensions.marginSizeHorizontal * 1.5),
      child: TrackingTransactionWidget(
        date: DateFormat("dd-MMM-yyyy").format(data.createdAt),
        color: data.status == 1
            ? CustomColor.yellowColorAssent
            : data.status == 2
                ? CustomColor.yellowColor
                : data.status == 6
                    ? CustomColor.greenColor
                    : data.status == 4
                        ? CustomColor.redColor
                        : CustomColor.thirdColor,
        trx: data.trxId,
        status: data.statusValue,
        senderCurrency: data.senderCurrency,
        receiverCurrency: data.receiverCurrency,
        senderAmount: data.senderAmount,
        receiverAmount: data.receiverAmount,
        senderMethod: data.senderGatewayName,
        receiverMethod: data.receiverGatewayName,
      ),
    );
  }

  _stepperWidget(BuildContext context) {
    var data = controller.trackModel.data.transaction;
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.2),
          child: TitleHeading2Widget(
            fontSize: isTab()
                ? Dimensions.headingTextSize1
                : Dimensions.headingTextSize1,
            text: Strings.transactionTracking,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          color: CustomColor.inputHintLightTextColor,
          child: const DottedDivider(),
        ),
        verticalSpace(Dimensions.heightSize * 0.5),
        //! stepper widget start
        Padding(
          padding: EdgeInsets.only(left: isTab() ?0:Dimensions.paddingSizeHorizontal),
          child: const StepperWidget(),
        ),
        verticalSpace(Dimensions.heightSize),
        //! end stepper widget
        //>>>.start reminder
        Visibility(
          visible: data.status != 6,
          child: Visibility(
              visible: data.status != 4,
            child: Padding(
              padding: EdgeInsets.only(left: Dimensions.paddingSizeHorizontal),
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  TitleHeading2Widget(
                      fontSize: isTab()
                          ? Dimensions.headingTextSize1
                          : Dimensions.headingTextSize3,
                      text: Strings.keepInMind),
                TitleHeading4Widget(
                    fontSize: isTab()
                        ? Dimensions.headingTextSize2
                        : Dimensions.headingTextSize4,
                    text: data.delayTime,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        verticalSpace(Dimensions.heightSize),
        Obx(
          () => pdfController.isDownloadLoading
              ? const CustomLoadingAPI()
              : PrimaryButton(
                borderWidth: 2,
                  fontSize: Dimensions.headingTextSize2 - 2,
                  borderColor: CustomColor.secondaryLightColor,
                  buttonTextColor: CustomColor.secondaryLightColor,
                  buttonColor: CustomColor.whiteColor,
                  title: Strings.downloadPDF,
                  onPressed: () {
                    pdfController.downloadPDF(
                      url: pdfController.exportPdfModel.data.downloadLink,
                      pdfFileName: 'Information',
                    );
                  }),
        ),
    
        Container(
          margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 0.8,
          bottom: Dimensions.marginSizeVertical * 0.8
          ),
          child: PrimaryButton(
            title: Strings.goToHome,
            onPressed: () {
              Get.offAllNamed(Routes.navigationScreen);
            },
          ),
        ),
      ],
    );
  }
}
