import '/controller/send_money/payment_gateway_controller.dart';

import '../../../utils/basic_screen_imports.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../utils/responsive_layout.dart';
import '../../../widgets/others/app_logo.dart';

class TatumManualScreen extends StatelessWidget {
  TatumManualScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final controller = Get.find<PaymentGatewayController>();

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      tabletScaffold: Container(),
      mobileScaffold: Scaffold(
        appBar: PrimaryAppBar(
          appBarSize: Dimensions.heightSize * 4.8,
          backgroundColor: Theme.of(context).primaryColor,
          Strings.tatum,
          color: CustomColor.whiteColor,
          iconBgColor: CustomColor.whiteColor.withValues(alpha:0.2),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const AppLogoWidget(),
            _bottomBodyWidget(context),
          ],
        ),
      ),
    );
  }

  _bottomBodyWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius * 3),
            topRight: Radius.circular(Dimensions.radius * 3),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          verticalSpace(Dimensions.heightSize),
          _inputWidget(context),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeHorizontal * .5),
            child: Obx(
                () => Get.find<PaymentGatewayController>().isAutomaticLoading
                    ? const CustomLoadingAPI()
                    : PrimaryButton(
                        title: Strings.confirm,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            controller.tatumSubmit();
                          }
                        },
                        buttonTextColor: CustomColor.primaryBGLightColor,
                        borderColor: CustomColor.primaryLightColor,
                        buttonColor: CustomColor.primaryLightColor,
                      )),
          ),
          verticalSpace(Dimensions.paddingSizeVertical * 1.5),
        ],
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeHorizontal * .7,
        vertical: Dimensions.paddingSizeHorizontal * .5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 1.5)),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ...Get.find<PaymentGatewayController>()
                .inputFieldsTatum
                .map((element) {
              return element;
            }),
            verticalSpace(Dimensions.marginBetweenInputBox),
            Visibility(
              visible: Get.find<PaymentGatewayController>()
                  .inputFieldControllersTatum
                  .isNotEmpty,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: .99,
                  ),
                  itemCount: Get.find<PaymentGatewayController>()
                      .inputFieldsTatum
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return Get.find<PaymentGatewayController>()
                        .inputFieldsTatum[index];
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
