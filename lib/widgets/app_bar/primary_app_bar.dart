import '../../utils/basic_screen_imports.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar(
    this.title, {
    super.key,
    this.backgroundColor,
    this.iconBgColor,
    this.color,
    this.elevation = 0,
    this.autoLeading = false,
    this.showBackButton = true,
    this.centerTitle = true,
    this.action,
    this.leading,
    this.bottom,                 
    this.toolbarHeight,
    this.appBarSize,
  });
    
  final String title;
  final Color? backgroundColor;
  final Color? color;
  final Color? iconBgColor;
  final double elevation;
  final List<Widget>? action;
  final Widget? leading;
  final bool autoLeading;
  final bool showBackButton;
  final bool centerTitle;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final double? appBarSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: TitleHeading4Widget(
        fontSize: Dimensions.headingTextSize2,
        text: title,
      color: color??CustomColor.primaryLightTextColor,
      fontWeight: FontWeight.w600,
      ),
      actions: action,
      leading: showBackButton
          ? Padding(
            padding:  EdgeInsets.only(
              left: Dimensions.paddingSizeHorizontal*0.25,
              right: Dimensions.paddingSizeHorizontal*0.08
            ),
            child: leading ??
                BackButtonWidget(
                  iconBgColor: iconBgColor,
                  onTap: () {
                    Get.close(1);
                  },
                ),
          )
          : null,
      bottom: bottom,
      elevation: elevation,
      toolbarHeight: toolbarHeight,
      scrolledUnderElevation: 0,
      backgroundColor:
          backgroundColor ?? CustomColor.primaryLightColor,
      automaticallyImplyLeading: autoLeading,
    );
  }

  @override
  // Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
  Size get preferredSize =>
      Size.fromHeight(appBarSize ?? Dimensions.appBarHeight*0.88);
}
