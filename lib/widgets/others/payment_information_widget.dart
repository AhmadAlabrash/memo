import '../../utils/basic_screen_imports.dart';

class PaymentInformationWidget extends StatelessWidget {
  const PaymentInformationWidget({
    super.key,
    required this.variable,
    required this.value,
    this.stoke = true,
  });
  final String variable, value;
  final bool stoke;
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Column(
      children: [
        verticalSpace(Dimensions.heightSize * 0.5),
        Row(
          mainAxisAlignment: mainSpaceBet,
          children: [
            Expanded(
              flex: 5,
              child: TitleHeading4Widget(
                maxLines: 1,
                textOverflow: TextOverflow.ellipsis,
                text: variable,
                fontSize: isTab()
                    ? Dimensions.headingTextSize2
                    : Dimensions.headingTextSize4,
                fontWeight: FontWeight.w500,
                color: CustomColor.secondaryLightTextColor,
              ),
            ),
            TitleHeading4Widget(
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              text: value,
              fontSize: isTab()
                  ? Dimensions.headingTextSize2
                  : Dimensions.headingTextSize4,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
        verticalSpace(Dimensions.heightSize * 0.59),
        Visibility(
            visible: stoke,
            child: Container(
                width: MediaQuery.of(context).size.width,
                color: CustomColor.inputHintLightTextColor.withValues(alpha:0.9),
                child: const DottedDivider())),
      ],
    );
  }
}

class DottedDivider extends StatelessWidget {
  const DottedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBorderPainter(
        color: CustomColor.inputHintLightTextColor.withValues(alpha:0.9),
        strokeWidth: 1.0, // Set the width of the dotted border
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    const double dashWidth = 3; // Adjust the width of the dashes
    const double dashSpace = 2; // Adjust the space between the dashes
    const double startY = 0;

    double currentX = 0;
    while (currentX < size.width) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashWidth, startY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
