import '/widgets/others/custom_image_widget.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/payment_information_widget.dart';
import '../text_labels/title_heading5_widget.dart';

class TrackingTransactionWidget extends StatelessWidget {
  const TrackingTransactionWidget({
    super.key,
    required this.trx,
    required this.date,
    required this.senderMethod,
    required this.senderAmount,
    required this.receiverMethod,
    required this.receiverAmount,
    required this.color,
    required this.status,
    required this.senderCurrency,
    required this.receiverCurrency,
  });

  final String trx,
      date,
      status,
      senderMethod,
      senderCurrency,
      receiverCurrency,
      senderAmount,
      receiverMethod,
      receiverAmount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.17),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal * 0.5,
          vertical: Dimensions.paddingSizeVertical * 0.5),
      decoration: BoxDecoration(
          color: CustomColor.inputFillLightTextColor,
          borderRadius: BorderRadius.circular(Dimensions.radius)),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Row(
            crossAxisAlignment: crossStart,
            children: [
              TitleHeading1Widget(
                text: trx,
                fontSize: isTab()
                    ? Dimensions.headingTextSize1
                    : Dimensions.headingTextSize3,
              ),
              horizontalSpace(Dimensions.widthSize * 0.5),
              Padding(
                padding: EdgeInsets.only(
                    top: isTab() ? Dimensions.paddingSize * 0.21 : Dimensions.paddingSize * 0.25),
                child: CircleAvatar(
                  radius: Dimensions.radius * 0.34,
                  backgroundColor: color,
                ),
              ),
              horizontalSpace(Dimensions.widthSize * 0.2),
              TitleHeading5Widget(
                  padding: EdgeInsets.only(
                      top: Dimensions.paddingSizeVertical * 0.2),
                  fontSize: isTab()
                      ? Dimensions.headingTextSize3
                      : Dimensions.headingTextSize6 - 3,
                  text: status),
            ],
          ),
          //>>>>>>>>>> date
          verticalSpace(Dimensions.heightSize * 0.3),
          TitleHeading4Widget(
            text: date,
            color: CustomColor.secondaryLightTextColor,
            fontSize: isTab()
                ? Dimensions.headingTextSize3
                : Dimensions.headingTextSize4,
          ),
          verticalSpace(Dimensions.heightSize * 0.3),
          //>>>>>>>>> divider
          Container(
              width: MediaQuery.of(context).size.width,
              color: CustomColor.inputHintLightTextColor,
              child: const DottedDivider()),
          verticalSpace(Dimensions.heightSize * 0.7),
          //>>>>>>>>>
          _stepperWidget(context),
        ],
      ),
    );
  }

  _stepperWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
              //>>>>>>>... stepper
              CustomImageWidget(
                path: Assets.icon.circle1,
                height: isTab()
                    ? Dimensions.heightSize
                    : Dimensions.heightSize * 1.2,
              ),
              Container(
                width: 2,
                height: 17.h,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: CustomColor.inputFillLightTextColor,
                      style: BorderStyle.none,
                      width: 1.0,
                    ),
                  ),
                ),
                child: CustomPaint(
                  painter: DottedBorderPainter(),
                ),
              ),

              CustomImageWidget(
                path: Assets.icon.circle1,
                color: CustomColor.inputHintLightTextColor,
                height: isTab()
                    ? Dimensions.heightSize
                    : Dimensions.heightSize * 1.2,
              ),
            ],
          ),
        ),
        horizontalSpace(Dimensions.widthSize * 0.4),

        ///>>>>> gateway  and amount
        Expanded(
          flex: 15,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  TitleHeading4Widget(
                    padding: EdgeInsets.only(
                        left: Dimensions.paddingSizeHorizontal * 0.2),
                    text: senderMethod,
                    fontWeight: FontWeight.w600,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize2
                        : Dimensions.headingTextSize4,
                    color: CustomColor.primaryLightTextColor,
                  ),
                  Row(children: [
                    TitleHeading5Widget(
                        color: CustomColor.primaryLightTextColor,
                        fontSize: isTab()
                            ? Dimensions.headingTextSize2
                            : Dimensions.headingTextSize4,
                        text: double.parse(senderAmount).toStringAsFixed(2)),
                    horizontalSpace(Dimensions.widthSize * 0.2),
                    TitleHeading5Widget(
                        color: CustomColor.secondaryLightColor,
                        fontSize: isTab()
                            ? Dimensions.headingTextSize2
                            : Dimensions.headingTextSize4,
                        text: senderCurrency),
                  ]),
                ],
              ),
              verticalSpace(
                isTab()
                    ? Dimensions.heightSize * 1.3
                    : Dimensions.heightSize * 0.7,
              ),
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  TitleHeading4Widget(
                    padding: EdgeInsets.only(
                        left: Dimensions.paddingSizeHorizontal * 0.2),
                    text: receiverMethod,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize2
                        : Dimensions.headingTextSize4,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      TitleHeading5Widget(
                        fontSize: isTab()
                            ? Dimensions.headingTextSize2
                            : Dimensions.headingTextSize4,
                        text: double.parse(receiverAmount).toStringAsFixed(2),
                      ),
                      horizontalSpace(Dimensions.widthSize * 0.2),
                      TitleHeading5Widget(
                          color: CustomColor.secondaryLightColor,
                          fontSize: isTab()
                              ? Dimensions.headingTextSize2
                              : Dimensions.headingTextSize4,
                          text: receiverCurrency),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = CustomColor.inputLabelLightTextColor
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    double dashWidth = 4.0;
    double dashSpace = 3.0;
    double startY = 0.0;
    double endY = size.height;

    while (startY < endY) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
