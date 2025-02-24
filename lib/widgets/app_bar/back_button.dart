import '/custom_assets/assets.gen.dart';
import '/widgets/others/custom_image_widget.dart';

import '../../utils/basic_widget_imports.dart';

class BackButtonWidget extends StatelessWidget {
   const BackButtonWidget(
      {Key? key,
      required this.onTap,
      this.iconBgColor,
      this.alignment})
      : super(key: key);
  final VoidCallback onTap;
  final Color? iconBgColor;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 650;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(Dimensions.paddingSize * 0.36),
        padding: EdgeInsets.all(isTablet() ? Dimensions.paddingSize * 0.3:Dimensions.paddingSize * 0.37),
        alignment: alignment,
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
    );
  }
}
