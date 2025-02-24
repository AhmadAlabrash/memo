import '/backend/utils/custom_loading_api.dart';
import '/controller/send_money/payment_gateway_controller.dart';
import '/widgets/navigation/dashboard_screen_widget.dart';

import '../../../controller/navigation/dashboard_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

class DashboardMobileScreen extends StatelessWidget {
  DashboardMobileScreen({
    super.key,
    required this.controller,
  });

  final DashboardController controller;
  final paymentController = Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: CustomColor.primaryLightColor,
          body: Obx(
            () => controller.isLoading || paymentController.isLoading
                ? CustomLoadingAPI(
                    color: CustomColor.secondaryLightColor,
                  )
                : _bodyWidget(context),
          )),
    );
  }

  _bodyWidget(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: height,
          width: width,
          child: RefreshIndicator(
          color: Theme.of(context).primaryColor,
          onRefresh: () async {
            controller.getDashboardApiProcess();
          },
          child: ListView(
            // physics: const BouncingScrollPhysics(),
            children: [
              _amountDetails(context),
              DashboardScreenWidget(),
            ],
          ),
        ),
      ),
    );
  }

  _amountDetails(BuildContext context) {
    var data = controller.dashboardModel.data;
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: Dimensions.marginSizeVertical),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          verticalSpace(Dimensions.heightSize),
          Column(
            mainAxisSize: mainMin,
            children: [
              CustomTitleHeadingWidget(
                text:
                    "${double.parse(data.totalTransferMoney).toStringAsFixed(2)} ${data.baseCurrencyCode}",
                style: GoogleFonts.inter(
                    fontSize: Dimensions.headingTextSize1 * 1.4,
                    color: CustomColor.whiteColor,
                    fontWeight: FontWeight.w800),
              ),
              TitleHeading4Widget(
                  fontSize: Dimensions.headingTextSize3,
                  fontWeight: FontWeight.w600,
                  text: Strings.totalSendMoney,
                  color: CustomColor.whiteColor.withValues(alpha:0.6)),
            ],
          ),
          verticalSpace(Dimensions.heightSize * 1.5),
          //transactions
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeHorizontal),
            child: Row(
              mainAxisAlignment: mainSpaceBet,
              children: [
                Column(
                  children: [
                    TitleHeading1Widget(
                      text: data.totalTransactions,
                      color: CustomColor.whiteColor.withValues(alpha:0.8),
                    ),
                    TitleHeading5Widget(
                      text: Strings.totalTransaction,
                      color: CustomColor.whiteColor.withValues(alpha:0.6),
                    )
                  ],
                ),
                Column(
                  children: [
                    TitleHeading1Widget(
                      text: int.parse(data.activeTickets.toString()).toString(),
                      color: CustomColor.whiteColor.withValues(alpha:0.8),
                    ),
                    TitleHeading5Widget(
                      text: Strings.activeTransaction,
                      color: CustomColor.whiteColor.withValues(alpha:0.6),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
