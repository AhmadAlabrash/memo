// Assuming you're using GetX for state management
import 'package:intl/intl.dart';
import '../../controller/tracking/transaction_tracking_controller.dart';
import '../../custom_assets/assets.gen.dart';
import '../../utils/basic_widget_imports.dart';
import '../others/custom_image_widget.dart';
import '../text_labels/title_heading5_widget.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final controller = Get.put(TrackingController());
    final formattedDate = DateFormat('dd MMM yyyy hh:mm a');
    var data = controller.trackModel.data.transaction;
    return Row(
      children: [
        Visibility(visible: data.status == 4, child: _rejectedWidget(context)),

        Visibility(
          visible: data.status != 4,
          child: Column(
            children: [
              //!>>>> 1 step
              CustomImageWidget(
                path: Assets.icon.circle1,
                height: Dimensions.heightSize * 1.2,
                color: CustomColor.primaryLightTextColor,
              ),
              Container(
                width: 2,
                 height: isTab() ? 40.h : 45.h,
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: CustomColor.primaryLightTextColor,
                      style: BorderStyle.none,
                      width: 1.0,
                    ),
                  ),
                ),
                child: CustomPaint(
                  painter: DottedBorderPainter(
                    borderColor: CustomColor.primaryLightTextColor,
                  ),
                ),
              ),
              ////!>>>>>>> step 2
              CustomImageWidget(
                path: Assets.icon.circle1,
                color: CustomColor.primaryLightTextColor,
                height: Dimensions.heightSize * 1.2,
              ),
              Container(
                width: 2,
          height: isTab() ? 40.h : 45.h,
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
                  painter: DottedBorderPainter(
                    borderColor: data.status == 1
                        ? CustomColor.primaryLightTextColor
                        : data.status == 6
                            ? CustomColor.primaryLightTextColor
                            : CustomColor.inputHintLightTextColor,
                  ),
                ),
              ),
              //!>>>>>>>> step 3
              CustomImageWidget(
                path: Assets.icon.circle1,
                color: data.status == 1
                    ? CustomColor.primaryLightTextColor
                    : data.status == 6
                        ? CustomColor.primaryLightTextColor
                        : CustomColor.inputHintLightTextColor,
                height: Dimensions.heightSize * 1.2,
              ),
              Container(
                width: 2,
                height: isTab() ? 40.h : 45.h,
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
                  painter: DottedBorderPainter(
                    borderColor: data.status == 1
                        ? CustomColor.primaryLightTextColor
                        : data.status == 6
                            ? CustomColor.primaryLightTextColor
                            : CustomColor.secondaryLightTextColor,
                  ),
                ),
              ),

              ///!>>>>>>>step 4
              CustomImageWidget(
                path: Assets.icon.circle1,
                color: data.status == 1
                    ? CustomColor.primaryLightTextColor
                    : data.status == 6
                        ? CustomColor.primaryLightTextColor
                        : CustomColor.inputHintLightTextColor,
                height: Dimensions.heightSize * 1.2,
              ),
              Container(
                width: 2,
                height: isTab() ? 40.h : 45.h,
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
                  painter: DottedBorderPainter(
                    borderColor: data.status == 6
                        ? CustomColor.primaryLightTextColor
                        : CustomColor.secondaryLightTextColor,
                  ),
                ),
              ),

              CustomImageWidget(
                path: Assets.icon.circle1,
                color: data.status == 6
                    ? CustomColor.primaryLightTextColor
                    : CustomColor.inputHintLightTextColor,
                height: Dimensions.heightSize * 1.2,
              ),
            ],
          ),
        ),
        horizontalSpace(Dimensions.widthSize),

        ///>>>>> gateway  and amount
        Visibility(
          visible: data.status != 4,
          child: Column(
            crossAxisAlignment: crossStart,
            children: [
              //!first
              verticalSpace(isTab()?Dimensions.heightSize*2.5:Dimensions.heightSize),
              TitleHeading4Widget(
                text: Strings.trackingText1,
                fontWeight: FontWeight.w600,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize4,
                color: CustomColor.primaryLightTextColor,
              ),
              TitleHeading5Widget(
                text: formattedDate.format(data.createdAt),
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize5,
              ),
              //!second
              verticalSpace(isTab()
                  ? Dimensions.heightSize * 2.5
                  : Dimensions.heightSize * 2),
              Row(
                children: [
                  TitleHeading4Widget(
                    text: Strings.trackingText2,
                    fontWeight: FontWeight.w600,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize3
                        : Dimensions.headingTextSize4,
                    color: CustomColor.primaryLightTextColor,
                  ),
                  horizontalSpace(Dimensions.widthSize * 0.3),
                  TitleHeading4Widget(
                    text: data.senderCurrency,
                    fontWeight: FontWeight.w600,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize3
                        : Dimensions.headingTextSize4,
                    color: CustomColor.primaryLightTextColor,
                  ),
                ],
              ),
              TitleHeading5Widget(
                text: formattedDate.format(data.createdAt),
                color: CustomColor.primaryLightTextColor,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize5,
              ),
              //!third

              verticalSpace(isTab()?Dimensions.heightSize*2.5: Dimensions.heightSize * 2),
              TitleHeading4Widget(
                text: Strings.trackingText3,
                fontWeight: FontWeight.w600,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize4,
                color: data.status == 1
                    ? CustomColor.primaryLightTextColor
                    : data.status == 6
                        ? CustomColor.primaryLightTextColor
                        : CustomColor.secondaryLightTextColor,
              ),

              TitleHeading5Widget(
                text: data.approvedTime == null
                    ? formattedDate.format(data.createdAt)
                    : formattedDate.format(data.approvedTime!),
                color: data.status == 1
                    ? CustomColor.primaryLightTextColor
                    : data.status == 6
                        ? CustomColor.primaryLightTextColor
                        : CustomColor.secondaryLightTextColor,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize5,
              ),
              //!fourth
              verticalSpace(isTab()
                  ? Dimensions.heightSize * 3
                  : Dimensions.heightSize * 2),

              TitleHeading4Widget(
                text: Strings.trackingText4,
                fontWeight: FontWeight.w600,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize4,
                color: data.status == 1
                    ? CustomColor.primaryLightTextColor
                    : data.status == 6
                        ? CustomColor.primaryLightTextColor
                        : CustomColor.secondaryLightTextColor,
              ),

              TitleHeading5Widget(
                text: data.approvedTime == null
                    ? formattedDate.format(data.createdAt)
                    : formattedDate.format(data.approvedTime!),
                color: data.status == 1
                    ? CustomColor.primaryLightTextColor
                    : data.status == 6
                        ? CustomColor.primaryLightTextColor
                        : CustomColor.secondaryLightTextColor,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize5,
              ),
              //!five
              verticalSpace(isTab()
                  ? Dimensions.heightSize * 3
                  : Dimensions.heightSize * 2),

              TitleHeading4Widget(
                text: Strings.trackingText5,
                fontWeight: FontWeight.w600,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize4,
                color: data.status == 6
                    ? CustomColor.primaryLightTextColor
                    : CustomColor.secondaryLightTextColor,
              ),
              TitleHeading5Widget(
                text: data.transferTime == null
                    ? "N/A"
                    : formattedDate.format(data.transferTime!),
                color: data.status == 6
                    ? CustomColor.primaryLightTextColor
                    : CustomColor.secondaryLightTextColor,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize5,
              ),
            ],
          ),
        )
      ],
    );
  }

  _rejectedWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final controller = Get.put(TrackingController());
    final formattedDate = DateFormat('dd MMM yyyy hh:mm a');
    var data = controller.trackModel.data.transaction;
    return Row(
      children: [
        Column(
          children: [
            //!>>>> 1 step
            CustomImageWidget(
              path: Assets.icon.circle1,
              height: Dimensions.heightSize * 1.2,
              color: CustomColor.primaryLightTextColor,
            ),
            Container(
              width: 2,
              height: 45.h,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: CustomColor.primaryLightTextColor,
                    style: BorderStyle.none,
                    width: 1.0,
                  ),
                ),
              ),
              child: CustomPaint(
                painter: DottedBorderPainter(
                  borderColor: CustomColor.primaryLightTextColor,
                ),
              ),
            ),
////!>>>>>>> step 2
            CustomImageWidget(
              path: Assets.icon.circle1,
              color: CustomColor.primaryLightTextColor,
              height: Dimensions.heightSize * 1.2,
            ),
            Container(
              width: 2,
              height: 45.h,
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
                painter: DottedBorderPainter(
                    borderColor: CustomColor.primaryLightTextColor),
              ),
            ),
//!>>>>>>>> step 3
            CustomImageWidget(
              path: Assets.icon.circle1,
              color: CustomColor.primaryLightTextColor,
              height: Dimensions.heightSize * 1.2,
            ),
          ],
        ),
        horizontalSpace(Dimensions.widthSize),

        ///>>>>> gateway  and amount
        Column(
          crossAxisAlignment: crossStart,
          children: [
            //!first
            verticalSpace(Dimensions.heightSize * 2),
            TitleHeading4Widget(
              text: Strings.trackingText1,
              fontWeight: FontWeight.w600,
              fontSize: isTab()
                  ? Dimensions.headingTextSize3
                  : Dimensions.headingTextSize4,
              color: CustomColor.primaryLightTextColor,
            ),
            TitleHeading5Widget(
              text: formattedDate.format(data.createdAt),
              fontSize: isTab()
                  ? Dimensions.headingTextSize3
                  : Dimensions.headingTextSize5,
            ),
            //!second
            verticalSpace(Dimensions.heightSize * 1.5),
            Row(
              children: [
                TitleHeading4Widget(
                  text: Strings.trackingText2,
                  fontWeight: FontWeight.w600,
                  fontSize: isTab()
                      ? Dimensions.headingTextSize3
                      : Dimensions.headingTextSize4,
                  color: CustomColor.primaryLightTextColor,
                ),
                horizontalSpace(Dimensions.widthSize * 0.3),
                TitleHeading4Widget(
                  text: data.senderCurrency,
                  fontWeight: FontWeight.w600,
                  fontSize: isTab()
                      ? Dimensions.headingTextSize3
                      : Dimensions.headingTextSize4,
                  color: CustomColor.primaryLightTextColor,
                ),
              ],
            ),
            TitleHeading5Widget(
              text: formattedDate.format(data.createdAt),
              color: CustomColor.primaryLightTextColor,
              fontSize: isTab()
                  ? Dimensions.headingTextSize3
                  : Dimensions.headingTextSize5,
            ),
            //!third

            verticalSpace(Dimensions.heightSize * 2),

            TitleHeading4Widget(
                text: data.rejectReason,
                fontWeight: FontWeight.w600,
                fontSize: isTab()
                    ? Dimensions.headingTextSize3
                    : Dimensions.headingTextSize4,
                color: CustomColor.primaryLightTextColor),

            TitleHeading5Widget(
              text: data.rejectTime == null
                  ? formattedDate.format(data.createdAt)
                  : formattedDate.format(data.rejectTime!),
              color: CustomColor.primaryLightTextColor,
              fontSize: isTab()
                  ? Dimensions.headingTextSize3
                  : Dimensions.headingTextSize5,
            ),
            //!fourth
            verticalSpace(Dimensions.heightSize * 2),
          ],
        )
      ],
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color borderColor;
  DottedBorderPainter({required this.borderColor});
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    Paint paint = Paint()
      ..color = borderColor
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
