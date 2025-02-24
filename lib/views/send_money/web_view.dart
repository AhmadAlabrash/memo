import 'dart:convert';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:moneymove/routes/routes.dart';
import 'package:moneymove/utils/basic_widget_imports.dart';
import '../../backend/local_storage/local_storage.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../custom_assets/assets.gen.dart';
import '../../widgets/others/custom_image_widget.dart';
import '/controller/send_money/payment_gateway_controller.dart';

// ignore: must_be_immutable
class WebPaymentScreen extends StatefulWidget {
  const WebPaymentScreen({super.key});

  @override
  State<WebPaymentScreen> createState() => _WebPaymentScreenState();
}

class _WebPaymentScreenState extends State<WebPaymentScreen> {
  final pController = Get.put(PaymentGatewayController());

  late InAppWebViewController webViewController;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(true);
  final controllerPDf = Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 650;
    }

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.navigationScreen);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.all(Dimensions.paddingSize * 0.36),
            padding: EdgeInsets.all(isTablet()
                ? Dimensions.paddingSize * 0.3
                : Dimensions.paddingSize * 0.37),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColor.secondaryLightColor,
            ),
            child: CustomImageWidget(
              path: Assets.icon.vector,
              height: isTablet() ? 30 : 18,
              width: isTablet() ? 30 : 18,
              color: CustomColor.whiteColor,
            ),
          ),
          backgroundColor: CustomColor.primaryLightColor,
          title: TitleHeading4Widget(
            fontSize: Dimensions.headingTextSize2,
            text: pController.senderWallet.value,
            color: CustomColor.whiteColor,
            fontWeight: FontWeight.w600,
          ),
          centerTitle: true,
        ),
        body: Obx(
          () => pController.isAutomaticLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    final paymentUrl = pController.submitAutomaticGatewayModel.data.redirectUrl;

    return Stack(
      children: [
        InAppWebView(
          onProgressChanged: (controller, progress) {},
          initialUrlRequest: URLRequest(url: Uri.parse(paymentUrl)),
          onWebViewCreated: (controller) {
            webViewController = controller;
            controller.addJavaScriptHandler(
              handlerName: 'jsHandler',
              callback: (args) {},
            );

            debugPrint('object');
          },
          onLoadStart: (controller, url) {
            isLoading.value = true;
          },
          onLoadStop: (controller, url) {
            controller
                .evaluateJavascript(
                    source: 'document.querySelector("pre").innerText;')
                .then((result) {
              if (result != null) {
                Map<String, dynamic> jsonData = json.decode(result);
                String transactionTrx = jsonData['data']['transaction_trx'];

                controllerPDf.pdfTrxString.value = transactionTrx;
                LocalStorages.saveTrackingTrx(trx: transactionTrx);
              }
            }).then((value) {
              if (url.toString().contains('stripe/payment/success') ||
                  url.toString().contains('sslcommerz/success') ||
                  url.toString().contains('success/response') ||
                  url.toString().contains('/callback')) {
                Get.toNamed(Routes.goToCongratulationScreen);
              }
            });

            isLoading.value = false;
          },
        ),
        ValueListenableBuilder<bool>(
          valueListenable: isLoading,
          builder: (context, isLoading, _) {
            return isLoading
                ? const Center(child: CustomLoadingAPI())
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
