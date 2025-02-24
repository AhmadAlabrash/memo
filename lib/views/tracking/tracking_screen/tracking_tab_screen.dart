import '../../../backend/utils/custom_loading_api.dart';
import '../../../controller/tracking/transaction_tracking_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/send_money/tracking_screen_widget.dart';

class TrackingScreenTabScreen extends StatelessWidget {
  const TrackingScreenTabScreen({
    super.key,
    required this.controller,
  });

  final TrackingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.primaryLightColor,
        appBar: AppBar(
          surfaceTintColor: CustomColor.whiteColor.withValues(alpha:0.15),
          centerTitle: true,
          leading: Container(),
          leadingWidth: MediaQuery.sizeOf(context).width * 0.12,
          toolbarHeight: Dimensions.heightSize * 5,
          backgroundColor: CustomColor.primaryLightColor,
          title: TitleHeading3Widget(
              fontSize: Dimensions.headingTextSize3 * 1.88,
              color: CustomColor.whiteColor,
              text: Strings.transactionTracking),
        ),
        body: Obx(
          () => controller.isLoading
              ? CustomLoadingAPI(
                  color: CustomColor.secondaryLightColor,
                )
              : _bodyWidget(context),
        ));
  }

  _bodyWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSizeHorizontal * 1.5),
        child: TrackingScreenWidget());
  }
}
