import '../../../backend/utils/custom_loading_api.dart';
import '../../../controller/tracking/transaction_tracking_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/send_money/tracking_screen_widget.dart';

class TrackingScreenMobileScreen extends StatelessWidget {
  const TrackingScreenMobileScreen({
    super.key,
    required this.controller,
  });

  final TrackingController controller;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        // ignore: deprecated_member_use
        onPopInvoked: (value) async {
          if (value) {
            Get.offAllNamed(Routes.navigationScreen);
          }
        },
        child: Scaffold(
            backgroundColor: CustomColor.primaryLightColor,
            appBar: PrimaryAppBar(
              leading: Container(),
              
              appBarSize: Dimensions.heightSize * 4,
              backgroundColor: CustomColor.primaryLightColor,
              Strings.transactionTracking,
              color: CustomColor.whiteColor,
              iconBgColor: CustomColor.primaryLightColor.withValues(alpha:0.6),
            ),
            body: Obx(
              () => controller.isLoading
                  ? CustomLoadingAPI(
                      color: CustomColor.secondaryLightColor,
                    )
                  : _bodyWidget(context),
            )));
  }

  _bodyWidget(BuildContext context) {
    return TrackingScreenWidget();
  }
}
