import 'package:flutter_svg/svg.dart';
import 'package:moneymove/backend/utils/custom_loading_api.dart';
import '../../controller/navigation/navigation_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/drawer/drawer_widget.dart';
import '../../widgets/others/custom_image_widget.dart';

class NavigationScreen extends StatelessWidget {
  final bottomNavBarController =
      Get.put(NavigationController(), permanent: false);
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  NavigationScreen({Key? key}) : super(key: key);
  // final dashBoardController = Get.put(DashBoardController());
  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Obx(
      () => Scaffold(
        drawer: DrawerScreen(),
        key: scaffoldKey,
        appBar: isTablet() ? tabAppBarWidget(context) : appBarWidget(context),
        extendBody: true,
        backgroundColor: CustomColor.primaryLightColor,
        bottomNavigationBar: isTablet()
            ? buildTabBottomNavigationMenu(context)
            : buildBottomNavigationMenu(
                context,
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: isTablet()
            ? bottomNavBarController
                .tabPage[bottomNavBarController.tabSelectedIndex.value]
            : bottomNavBarController
                .page[bottomNavBarController.selectedIndex.value],
      ),
    );
  }

  appBarWidget(BuildContext context) {
    return bottomNavBarController.selectedIndex.value == 1
        ? AppBar(
            backgroundColor: bottomNavBarController.selectedIndex.value == 1
                ? CustomColor.primaryLightColor
                : CustomColor.whiteColor,
            elevation: bottomNavBarController.selectedIndex.value == 0 ? 0 : 0,
            centerTitle:
                bottomNavBarController.selectedIndex.value == 1 ? true : false,
            leading: bottomNavBarController.selectedIndex.value == 1
                ? GestureDetector(
                    onTap: () {
                      // if (dashBoardController.isLoading == false) {
                      scaffoldKey.currentState!.openDrawer();
                      // }
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: Dimensions.paddingSizeHorizontal * 0.8,
                            right: Dimensions.paddingSizeHorizontal * 0.4),
                        child: CustomImageWidget(
                          path: Assets.icon.widgets,
                          height: 19.h,
                          width: 19.w,
                          color: CustomColor.whiteColor,
                        )),
                  )
                : Container(),
            title: bottomNavBarController.selectedIndex.value == 1
                ? Padding(
                    padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
                    child: TitleHeading4Widget(
                      text: Strings.appName,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.whiteColor,
                      fontSize: Dimensions.headingTextSize5 * 1.7,
                    ),
                  )
                : Container(),
            actions: [
              bottomNavBarController.selectedIndex.value == 1
                  ? Padding(
                      padding: EdgeInsets.only(
                        right: Dimensions.paddingSize * 0.7,
                        left: Dimensions.paddingSize * 0.4,
                        top: Dimensions.paddingSizeVertical * 0.33,
                        bottom: Dimensions.paddingSizeVertical * 0.33,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.notificationScreen);
                        },
                        child: CustomImageWidget(
                          path: Assets.icon.notifications,
                          height: 23.h,
                          width: 23.w,
                          color: CustomColor.whiteColor,
                        ),
                      ),
                    )
                  : Container()
            ],
          )
        : bottomNavBarController.selectedIndex.value == 0
            ? AppBar(
                backgroundColor: CustomColor.whiteColor,
                scrolledUnderElevation: 0,
                leading: Container(),
                title: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
                  child: TitleHeading4Widget(
                    text: Strings.profileUpdate,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.primaryLightTextColor,
                    fontSize: Dimensions.headingTextSize5 * 1.7,
                  ),
                ))
            : AppBar(
                backgroundColor: CustomColor.whiteColor,
                scrolledUnderElevation: 0,
                leading: Container(),
                title: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
                  child: TitleHeading4Widget(
                    text: Strings.transactionLogs,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.primaryLightTextColor,
                    fontSize: Dimensions.headingTextSize5 * 1.7,
                  ),
                ),
              );
  }

  buildTabBottomNavigationMenu(context) {
    return BottomAppBar(
      height: MediaQuery.sizeOf(context).height * 0.08,
      elevation: 0,
      notchMargin: 7,
      color: CustomColor.transparent,
      child: Container(
        margin: EdgeInsets.only(
          left: Dimensions.marginSizeVertical * 4,
          right: Dimensions.marginSizeVertical * 4,
          bottom: Dimensions.marginSizeVertical * 0.2,
        ),
        padding: EdgeInsets.only(
          left: Dimensions.paddingSizeHorizontal * 0.2,
          top: Dimensions.paddingSizeHorizontal * 0.1,
          bottom: Dimensions.paddingSizeHorizontal * 0.1,
          right: Dimensions.paddingSizeHorizontal * 0.2,
        ),
        decoration: BoxDecoration(
            color: bottomNavBarController.tabSelectedIndex.value == 1
                ? CustomColor.primaryLightColor
                : CustomColor.whiteColor.withValues(alpha:0.15),
            borderRadius: BorderRadius.circular(Dimensions.radius * 3.22)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            bottomTabItemWidget(
                context, Assets.icon.otherHouses, Strings.home, 0),
            bottomTabItemWidget(
                context, Assets.icon.historyTab, Strings.history, 1),
            bottomTabItemWidget(
                context, Assets.icon.profileTab, Strings.profile, 2),
            bottomTabItemWidget(
                context, Assets.icon.settings, Strings.settings, 3),
          ],
        ),
      ),
    );
  }

  bottomTabItemWidget(context, var icon, label, page) {
    return Obx(
      () => InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          bottomNavBarController.tabSelectedIndex.value = page;
        },
        child: bottomNavBarController.tabSelectedIndex.value == page
            ? Container(
                alignment: Alignment.center,
                height: Dimensions.heightSize * 3.3,
                width: Dimensions.widthSize * 5.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius * 2),
                  color: CustomColor.whiteColor,
                ),
                child: _buildRow(context, icon, label, page),
              )
            : Container(
                alignment: Alignment.center,
                height: Dimensions.heightSize * 3.5,
                width: Dimensions.heightSize * 4,
                child: _buildRow(context, icon, label, page),
              ),
      ),
    );
  }

  _buildRow(context, var icon, label, page) {
    return Row(
      mainAxisAlignment: mainCenter,
      crossAxisAlignment: crossCenter,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 0.7),
          child: SvgPicture.asset(
            icon,
            // ignore: deprecated_member_use
            color: bottomNavBarController.tabSelectedIndex.value == page
                ? CustomColor.secondaryLightColor
                : CustomColor.whiteColor.withValues(alpha:0.6),
            height: Dimensions.heightSize * 2.5,
            width: Dimensions.widthSize * 2.3,
          ),
        ),
        horizontalSpace(Dimensions.widthSize * 0.1),
        Visibility(
          visible: bottomNavBarController.tabSelectedIndex.value == page,
          child: CustomTitleHeadingWidget(
            text: label,
            style: GoogleFonts.inter(
              fontSize: Dimensions.headingTextSize3,
              fontWeight: FontWeight.w600,
              color: bottomNavBarController.tabSelectedIndex.value == page
                  ? CustomColor.secondaryLightColor
                  : CustomColor.whiteColor.withValues(alpha:0.6),
            ),
          ),
        ),
      ],
    );
  }

  tabAppBarWidget(BuildContext context) {
    return bottomNavBarController.tabSelectedIndex.value == 0
        ? AppBar(
            toolbarHeight: 90,
            backgroundColor: bottomNavBarController.tabSelectedIndex.value == 0
                ? CustomColor.primaryLightColor
                : CustomColor.whiteColor,
            elevation:
                bottomNavBarController.tabSelectedIndex.value == 0 ? 0 : 0,
            centerTitle: bottomNavBarController.tabSelectedIndex.value == 0
                ? true
                : false,
            leadingWidth: 85,
            leading: bottomNavBarController.tabSelectedIndex.value == 0
                ? GestureDetector(
                    onTap: () {
                      scaffoldKey.currentState!.openDrawer();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.paddingSizeHorizontal * 0.5,
                          right: Dimensions.paddingSizeHorizontal * 0.1,
                          bottom: Dimensions.paddingSizeVertical * 0.1),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor:
                            CustomColor.whiteColor.withValues(alpha:0.15),
                        child: Padding(
                          padding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
                          child: CustomImageWidget(
                            path: Assets.icon.widgets,
                            height: 110.h,
                            width: 110.w,
                            color: CustomColor.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
            title: bottomNavBarController.tabSelectedIndex.value == 0
                ? Padding(
                    padding: EdgeInsets.all(Dimensions.paddingSize),
                    child: TitleHeading4Widget(
                      text: Strings.appName,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.whiteColor,
                      fontSize: Dimensions.headingTextSize3 * 2.2,
                    ),
                  )
                : Container(),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  right: Dimensions.paddingSizeHorizontal * 0.6,
                  top: Dimensions.paddingSizeHorizontal * 0.4,
                  bottom: Dimensions.paddingSizeHorizontal * 0.4,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.notificationScreen);
                  },
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: CustomColor.whiteColor.withValues(alpha:0.15),
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSize * 0.3),
                      child: CustomImageWidget(
                        path: Assets.icon.notifications,
                        height: 90.h,
                        width: 90.w,
                        color: CustomColor.whiteColor,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        : bottomNavBarController.tabSelectedIndex.value == 1
            ? AppBar(
                surfaceTintColor: CustomColor.whiteColor,
                toolbarHeight: Dimensions.heightSize * 4.2,
                centerTitle: true,
                backgroundColor: CustomColor.whiteColor,
                scrolledUnderElevation: 0,
                leading: Container(),
                title: Padding(
                  padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
                  child: TitleHeading4Widget(
                    text: Strings.transactionLogs,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.primaryLightTextColor,
                    fontSize: Dimensions.headingTextSize3 * 2,
                  ),
                ))
            : bottomNavBarController.tabSelectedIndex.value == 2
                ? AppBar(
                    surfaceTintColor: CustomColor.whiteColor,
                    toolbarHeight: Dimensions.heightSize * 4.2,
                    centerTitle: true,
                    backgroundColor: CustomColor.primaryLightColor,
                    scrolledUnderElevation: 0,
                    leading: Container(),
                    title: Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
                      child: TitleHeading4Widget(
                        text: Strings.profileUpdate,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.whiteColor,
                        fontSize: Dimensions.headingTextSize3 * 2,
                      ),
                    ),
                  )
                : AppBar(
                    surfaceTintColor: CustomColor.whiteColor,
                    toolbarHeight: Dimensions.heightSize * 4.2,
                    centerTitle: true,
                    backgroundColor: CustomColor.primaryLightColor,
                    scrolledUnderElevation: 0,
                    leading: Container(),
                    title: Padding(
                      padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
                      child: TitleHeading4Widget(
                        text: Strings.settings,
                        fontWeight: FontWeight.w600,
                        color: CustomColor.whiteColor,
                        fontSize: Dimensions.headingTextSize3 * 2,
                      ),
                    ),
                  );
  }

  buildBottomNavigationMenu(context) {
    return Obx(
      () => bottomNavBarController.dashboardController.isLoading ||
              bottomNavBarController.dashboardController.controller.isLoading
          ? CustomLoadingAPI(
            color: CustomColor.secondaryLightColor,
            )
          : BottomAppBar(
              elevation: 0,
              color: CustomColor.whiteColor,
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
}
