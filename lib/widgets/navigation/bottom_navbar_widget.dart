import 'package:flutter_svg/svg.dart';
import '../../utils/basic_screen_imports.dart';
buildBottomNavigationMenu(context, bottomNavBarController) {
  return BottomAppBar(
    elevation: 0,
   

    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      margin: EdgeInsets.only(
        left: Dimensions.marginSizeVertical * 0.7,
        right: Dimensions.marginSizeVertical * 0.7,
        bottom: Dimensions.marginSizeVertical * 0.2,
      ),
      decoration: BoxDecoration(
        color: CustomColor.primaryLightColor,
        borderRadius: BorderRadius.circular(
          Dimensions.radius * 3.22,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          bottomItemWidget(
            Assets.icon.profileTab,
            bottomNavBarController,
            0,
            CustomColor.transparent,
            CustomColor.transparent,
          ),
          bottomItemWidget(
            Assets.icon.send,
            bottomNavBarController,
            1,
            CustomColor.whiteColor.withValues(alpha:0.17),
            CustomColor.whiteColor.withValues(alpha:0.1),
          ),
          bottomItemWidget(
            Assets.icon.historyTab,
            bottomNavBarController,
            2,
            CustomColor.transparent,
            CustomColor.transparent,
          ),
        ],
      ),
    ),
  );
}

bottomItemWidget(
  var icon,
  bottomNavBarController,
  page,
  Color color,
  Color color2,
) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        bottomNavBarController.selectedIndex.value = page;
      },
      child: CircleAvatar(
        radius: 20.r,
        backgroundColor: color2,
        child: CircleAvatar(
          radius: 15.r,
          backgroundColor: color,
          child: SvgPicture.asset(
            icon,
            // ignore: deprecated_member_use
            color: bottomNavBarController.selectedIndex.value == page
                ? CustomColor.whiteColor
                : CustomColor.whiteColor.withValues(alpha:0.3),
            height: Dimensions.heightSize * 2,
          ),
        ),
      ),
    ),
  );
}
