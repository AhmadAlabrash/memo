import '../../utils/basic_widget_imports.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({Key? key, required this.isChecked, this.onChecked})
      : super(key: key);
  final RxBool isChecked;
  final void Function(bool)? onChecked;

  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return InkWell(
      borderRadius: BorderRadius.circular(Dimensions.radius * .4),
      onTap: () {
        isChecked.value = !isChecked.value;
        onChecked!(isChecked.value);
      },
      child: Obx(
        () => Row(
          children: [
            Container(
              height: isTab()
                  ? Dimensions.heightSize 
                  : Dimensions.heightSize * 1.2,
              width: isTab()
                  ? Dimensions.widthSize * 1
                  : Dimensions.widthSize * 1.56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius * .3),
                color: isChecked.value
                    ? CustomColor.whiteColor
                    : CustomColor.secondaryLightColor,
                border: Border.all(
                  width: isTab()?2:1.4 ,
                  color: CustomColor.deActiveColorColor,
                ),
              ),
              child: Icon(
                Icons.check,
                size: Dimensions.heightSize,
                color: isChecked.value ? CustomColor.whiteColor : Colors.white,
              ),
            ),
            horizontalSpace(Dimensions.widthSize * 0.6),
            CustomTitleHeadingWidget(
              text: Strings.rememberMe.tr,
              style: Get.isDarkMode
                  ? CustomStyle.darkHeading5TextStyle.copyWith(
                      color: CustomColor.primaryDarkTextColor.withValues(alpha:.40),
                      letterSpacing: .01,
                      fontSize: isTab()
                          ? Dimensions.headingTextSize3
                          : Dimensions.headingTextSize5,
                      wordSpacing: .01)
                  : CustomStyle.lightHeading5TextStyle.copyWith(
                      color: CustomColor.deActiveColorColor,
                      fontSize: isTab()
                          ? Dimensions.headingTextSize3
                          : Dimensions.headingTextSize5,
                      letterSpacing: .01,
                      wordSpacing: .01),
            ),
          ],
        ),
      ),
    );
  }
}
