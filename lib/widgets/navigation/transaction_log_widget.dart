import 'package:intl/intl.dart';
import '/widgets/others/custom_image_widget.dart';
import '../../backend/model/dashboard/transaction_model.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/payment_information_widget.dart';
import '../text_labels/title_heading5_widget.dart';

class TransactionWidget extends StatelessWidget {
  const TransactionWidget({
    super.key,
    required this.data,
  });

  final Transaction data;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat("dd-MMM-yyyy");
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin:
          EdgeInsets.symmetric(vertical: Dimensions.marginSizeVertical * 0.17),
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal * 0.9,
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
                text: data.trxId,
                fontSize: Dimensions.headingTextSize3,
              ),
              horizontalSpace(Dimensions.widthSize * 0.5),
              Padding(
                padding: EdgeInsets.only(
                    top: isTab()
                        ? Dimensions.paddingSize * 0.1
                        : Dimensions.paddingSize * 0.25),
                child: CircleAvatar(
                  radius: Dimensions.radius * 0.32,
                  backgroundColor: data.status == 1
                      ? CustomColor.yellowColorAssent
                      : data.status == 2
                          ? CustomColor.yellowColor
                          : data.status == 6
                              ? CustomColor.greenColor
                              : data.status == 4
                                  ? CustomColor.redColor
                                  : CustomColor.thirdColor,
                ),
              ),
              horizontalSpace(Dimensions.widthSize * 0.2),
              TitleHeading5Widget(
                padding:
                    EdgeInsets.only(top: Dimensions.paddingSizeVertical * 0.17),
                text: data.statusValue,
                fontSize: Dimensions.headingTextSize6 - 3,
              ),
            ],
          ),
          //>>>>>>>>>> date
          verticalSpace(Dimensions.heightSize * 0.3),
          TitleHeading4Widget(
            text: dateFormat.format(data.createdAt),
            color: CustomColor.secondaryLightTextColor,
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
                height: Dimensions.heightSize * 1.2,
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
                height: Dimensions.heightSize * 1.2,
              ),
            ],
          ),
        ),
        horizontalSpace(Dimensions.widthSize),

        ///>>>>> gateway  and amount
        Expanded(
          flex: 15,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  TitleHeading4Widget(
                    text: data.senderGatewayName,
                    fontWeight: FontWeight.w600,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize3
                        : Dimensions.headingTextSize4,
                    color: CustomColor.primaryLightTextColor,
                  ),
                  Row(children: [
                    TitleHeading4Widget(
                        color: CustomColor.primaryLightTextColor,
                        text:
                            double.parse(data.senderAmount).toStringAsFixed(2)),
                    horizontalSpace(Dimensions.widthSize * 0.2),
                    TitleHeading4Widget(
                        color: CustomColor.secondaryLightColor,
                        text: data.senderCurrency),
                  ])
                ],
              ),
              verticalSpace(
                isTab()
                    ? Dimensions.heightSize * 1.7
                    : Dimensions.heightSize * 0.7,
              ),
              Row(
                mainAxisAlignment: mainSpaceBet,
                children: [
                  TitleHeading4Widget(
                    color: CustomColor.secondaryLightTextColor,
                    text: data.receiverGatewayName,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize3
                        : Dimensions.headingTextSize4,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      TitleHeading4Widget(
                          color: CustomColor.primaryLightTextColor,
                          text: double.parse(data.receiverAmount)
                              .toStringAsFixed(2)),
                      horizontalSpace(Dimensions.widthSize * 0.2),
                      TitleHeading4Widget(
                          color: CustomColor.secondaryLightColor,
                          text: data.receiverCurrency),
                    ],
                  ),
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
  void paint(
    Canvas canvas,
    Size size,
  ) {
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
