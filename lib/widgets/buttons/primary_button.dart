import '../../../utils/basic_screen_imports.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.borderWidth = 0,
    this.height,
    this.radius,
    this.buttonColor,
    this.buttonTextColor,
    this.shape,
    this.icon,
    this.fontSize,
    this.isExpanded = false,
    this.flex = 1,
    this.fontWeight,
    this.elevation,
    this.isLoading = false,
  });
  final String title;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double borderWidth;
  final double? height;
  final double? radius;
  final double? elevation;
  final int flex;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final OutlinedBorder? shape;
  final Widget? icon;
  final bool isExpanded;
  final bool isLoading;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Expanded(
            flex: flex,
            child: _buildButton(context),
          )
        : _buildButton(context);
  }

  Widget _buildButton(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: CustomColor.whiteColor,
          elevation: elevation,
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeVertical * 0.4),
          shape: shape ??
              RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(radius ?? Dimensions.radius * 0.7)),
          backgroundColor: buttonColor ?? CustomColor.secondaryLightColor,
          side: BorderSide(
            width: borderWidth,
            color: borderColor ?? CustomColor.secondaryLightColor,
          ),
        ),
        child: CustomTitleHeadingWidget(
         text: title,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
          style: CustomStyle.darkHeading3TextStyle.copyWith(
            fontSize: isTab()
                ? Dimensions.headingTextSize1
                : Dimensions.headingTextSize3,
            fontWeight: fontWeight ?? FontWeight.w600,
            color: buttonTextColor ??
                (Get.isDarkMode
                    ? CustomColor.primaryLightTextColor
                    : CustomColor.primaryDarkTextColor),
          ),
        ),
      ),
    );
  }
}
