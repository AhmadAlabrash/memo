import '../../utils/basic_screen_imports.dart';

class TitleSubTitleWidget extends StatelessWidget {
  const TitleSubTitleWidget({
    super.key,
    required this.title,
    required this.subTitle,
    this.subTitleFontSize,
    this.titleColor,
    this.subTitleColor,
    this.isCenterText = false,
  });
  final String title, subTitle;
  final double? subTitleFontSize;
  final Color? titleColor, subTitleColor;
  final bool isCenterText;
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Column(
      crossAxisAlignment: isCenterText ? crossCenter : crossStart,
      mainAxisAlignment: isCenterText ? mainCenter : mainCenter,
      mainAxisSize: mainMin,
      children: [
        TitleHeading2Widget(
          text: title,
          color: titleColor ?? CustomColor.primaryLightTextColor,
          fontWeight: FontWeight.w600,
          fontSize: isTab()
              ? Dimensions.headingTextSize3 * 2
              : Dimensions.headingTextSize2,
          textAlign: isCenterText ? TextAlign.center : TextAlign.start,
        ),
        verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
        Visibility(
          visible: subTitle != '',
          child: TitleHeading4Widget(
            text: subTitle,
            color: subTitleColor ?? CustomColor.secondaryLightTextColor,
            fontWeight: FontWeight.w500,
            fontSize: isTab()
                ? Dimensions.headingTextSize3 + 2
                : Dimensions.headingTextSize5 - 1,
            textAlign: isCenterText ? TextAlign.center : TextAlign.start,
          ),
        ),
      ],
    );
  }
}
