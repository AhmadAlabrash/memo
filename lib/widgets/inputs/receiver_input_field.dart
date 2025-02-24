import '/backend/model/transfer/payment_gateway_model.dart';
import '../../controller/navigation/dashboard_controller.dart';
import '../../controller/send_money/payment_gateway_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/custom_dropdown.dart';

class ReceiverInputWidget extends StatelessWidget {
  ReceiverInputWidget({super.key});
  final controller = Get.put(DashboardController());
  final gatewayController = Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        _labelWidget(context),
        _dropdownWidget(context),
        _inputWithDropdown(context),
      ],
    );
  }

  _labelWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Column(
      crossAxisAlignment: crossStart,
      children: [
        TitleHeading4Widget(
          fontSize: isTab()
              ? Dimensions.headingTextSize1
              : Dimensions.headingTextSize3,
          fontWeight: FontWeight.w500,
          color: CustomColor.inputLabelLightTextColor,
          text: Strings.receivingInformation,
        ),
        verticalSpace(Dimensions.heightSize * 0.05),
        Container(
          color: CustomColor.primaryLightColor,
          height: isTab()
              ? Dimensions.heightSize * 0.3
              : Dimensions.heightSize * 0.36,
          width: isTab()
              ? MediaQuery.sizeOf(context).width * 0.12
              : MediaQuery.sizeOf(context).width * 0.19,
        ),
        verticalSpace(
          Dimensions.heightSize * 0.1,
        )
      ],
    );
  }

  _dropdownWidget(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.5),
      child: CustomDropDown<CurrencyReceiver>(
        hintImage: gatewayController.receiverHintImage.value,
        items: gatewayController.receiverCurrencyList,

        hint: gatewayController.receiverWallet.value,
        onChanged: (value) {
          gatewayController.receiverWallet.value = value!.name;
          gatewayController.receiverImage.value = value.image;
          gatewayController.receiverCurrency.value = value.currencyCode;
          gatewayController.receiverRate.value = double.parse(value.rate);
          gatewayController.receiverAlias.value = value.alias;
          
          gatewayController.inputOnChangeReceiver;
          gatewayController.receiverAmountController.text == "0.00"
              ? ""
              : gatewayController.receiverAmountController.text;
          gatewayController.receiverExchange.value = double.parse(value.rate);

          gatewayController.exchangeRate.value =
              gatewayController.receiverExchange.value /
                  gatewayController.senderExchange.value;
        },
        titleTextColor: CustomColor.primaryLightTextColor.withValues(alpha:0.30),
        // titleStyle: CustomStyle.defaultButtonStyle,
        dropDownColor: Theme.of(context).primaryColor,
        borderEnable: false,
        dropDownFieldColor: Theme.of(context).scaffoldBackgroundColor,
        dropDownIconColor: CustomColor.primaryLightTextColor.withValues(alpha:0.30),
      ),
    );
  }

  ///input with dropdown
  _inputWithDropdown(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Obx(
      () => TextField(
        onChanged: (value) {
          gatewayController.inputOnChangeSender;
        },
        controller: gatewayController.receiverAmountController,
        keyboardType: TextInputType.number,
        style: CustomStyle.darkHeading4TextStyle.copyWith(
          fontSize: isTab()
              ? Dimensions.headingTextSize1
              : Dimensions.headingTextSize3,
          fontWeight: FontWeight.w600,
          color: CustomColor.primaryLightTextColor,
        ),
        cursorColor: CustomColor.primaryLightTextColor,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColor.secondaryLightTextColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: CustomColor.secondaryLightTextColor),
          ),
          contentPadding: EdgeInsets.only(
            top: Dimensions.paddingSizeVertical * 0.4,
            left: Dimensions.paddingSizeHorizontal * 0.5,
            right: Dimensions.paddingSizeHorizontal * 0.5,
          ),
          hintText: Strings.enterAmount.translation,
          hintStyle: GoogleFonts.inter(
            fontSize: isTab()
                ? Dimensions.headingTextSize1
                : Dimensions.headingTextSize3,
            fontWeight: FontWeight.w500,
            color: CustomColor.inputHintLightTextColor,
          ),
          //!!>>>>>>>>>>>>>. here is currency dropdown
          suffixIcon: Container(
            margin: EdgeInsets.only(
                left: Dimensions.marginSizeHorizontal * 0.1,
                right: Dimensions.marginSizeHorizontal * 0.1,
                bottom: Dimensions.marginSizeVertical * 0.25),
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeHorizontal * 0.7,
                vertical: Dimensions.paddingSizeVertical * 0.3),
            decoration: BoxDecoration(
              color: CustomColor.primaryLightColor,
              borderRadius: BorderRadius.circular(Dimensions.radius * 2.3),
            ),
            child: CustomTitleHeadingWidget(
              text: gatewayController.receiverCurrency.value,
              style: CustomStyle.lightHeading3TextStyle.copyWith(
                  fontWeight: FontWeight.w500,
                  color: CustomColor.whiteColor,
                  fontSize: isTab()
                      ? Dimensions.headingTextSize1
                      : Dimensions.headingTextSize3),
            ),
          ),
        ),
      ),
    );
  }
}
