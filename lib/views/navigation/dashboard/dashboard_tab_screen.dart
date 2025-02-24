

import '../../../backend/utils/custom_loading_api.dart';
import '../../../controller/navigation/dashboard_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/navigation/dashboard_screen_widget.dart';

class DashboardTabScreen extends StatelessWidget {
  const DashboardTabScreen({
    super.key,
    required this.controller,
  });
  final DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.primaryLightColor,
        body: Obx(
          () => controller.isLoading
              ? CustomLoadingAPI(
                  color: CustomColor.secondaryLightColor,
                )
              : _bodyWidget(context),
        ));
  }

  _bodyWidget(BuildContext context) {
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
            _amountDetails(context),
            Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Dimensions.marginSizeHorizontal * 0.6),
                child: DashboardScreenWidget()),
          ],
        ),
      ),
    );
  }

  _amountDetails(BuildContext context) {
    var data = controller.dashboardModel.data;
    return Padding(
      padding: EdgeInsets.all(Dimensions.paddingSize * 0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.2,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.only(
                  bottom: Dimensions.paddingSizeVertical * 0.25),
              decoration: BoxDecoration(
                color: CustomColor.whiteColor.withValues(alpha:0.4),
                borderRadius: BorderRadius.circular(Dimensions.radius * 2),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeHorizontal * 0.8,
                ),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.5),
                    color: CustomColor.whiteColor),
                child: Column(
                  mainAxisSize: mainMin,
                  children: [
                    FittedBox(
                      child: CustomTitleHeadingWidget(
                        maxLines: 1,
                        text:
                            "${double.parse(data.totalTransferMoney).toStringAsFixed(2)} ${data.baseCurrencyCode}",
                        style: GoogleFonts.inter(
                          color: CustomColor.primaryLightTextColor,
                          fontSize: Dimensions.headingTextSize3 * 2,
                          fontWeight: FontWeight.w800,
                          height: 0,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: TitleHeading4Widget(
                        maxLines: 1,
                        fontSize: Dimensions.headingTextSize4 + 1,
                        fontWeight: FontWeight.w500,
                        text: Strings.totalSendMoney,
                        color:
                            CustomColor.primaryLightTextColor.withValues(alpha:0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          horizontalSpace(Dimensions.widthSize * 0.5),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.2,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.only(
                  bottom: Dimensions.paddingSizeVertical * 0.25),
              decoration: BoxDecoration(
                color: CustomColor.whiteColor.withValues(alpha:0.4),
                borderRadius: BorderRadius.circular(Dimensions.radius * 2),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeHorizontal * 0.8,
                ),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.5),
                    color: CustomColor.whiteColor),
                child: Column(
                  mainAxisSize: mainMin,
                  children: [
                    FittedBox(
                      child: CustomTitleHeadingWidget(
                        text: data.totalTransactions,
                        maxLines: 1,
                        style: GoogleFonts.inter(
                            color: CustomColor.primaryLightTextColor,
                            fontSize: Dimensions.headingTextSize3 * 2,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    FittedBox(
                      child: TitleHeading4Widget(
                        maxLines: 1,
                        fontSize: Dimensions.headingTextSize4 + 1,
                        fontWeight: FontWeight.w500,
                        text: Strings.totalTransaction,
                        color:
                            CustomColor.primaryLightTextColor.withValues(alpha:0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          horizontalSpace(Dimensions.widthSize * 0.5),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).height * 0.2,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              padding: EdgeInsets.only(
                  bottom: Dimensions.paddingSizeVertical * 0.25),
              decoration: BoxDecoration(
                color: CustomColor.whiteColor.withValues(alpha:0.4),
                borderRadius: BorderRadius.circular(Dimensions.radius * 2),
              ),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.paddingSizeHorizontal * 0.8,
                ),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 1.5),
                    color: CustomColor.whiteColor),
                child: Column(
                  mainAxisAlignment: mainCenter,
                  children: [
                    FittedBox(
                      child: CustomTitleHeadingWidget(
                        maxLines: 1,
                        text:
                            int.parse(data.activeTickets.toString()).toString(),
                        style: GoogleFonts.inter(
                            color: CustomColor.primaryLightTextColor,
                            fontSize: Dimensions.headingTextSize3 * 2,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    FittedBox(
                      child: TitleHeading4Widget(
                        maxLines: 1,
                        fontSize: Dimensions.headingTextSize4 + 1,
                        fontWeight: FontWeight.w500,
                        text: Strings.activeTransaction,
                        color:
                            CustomColor.primaryLightTextColor.withValues(alpha:0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
