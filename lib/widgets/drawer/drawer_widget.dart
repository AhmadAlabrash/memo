import 'dart:ui';
import 'package:flutter_animate/flutter_animate.dart';
import '/controller/navigation/profile_controller.dart';
import '/language/language_drop_down.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../controller/auth/sign_out_and_delete/sign_out_controller.dart';
import '../../controller/navigation/navigation_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../others/custom_container.dart';
import '../others/custom_image_widget.dart';
import 'image_picker.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  final controller = Get.put(NavigationController());
  final signOutController = Get.put(SignOutController());
  final profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Drawer(
      width: isTab()
          ? MediaQuery.sizeOf(context).width * 0.6
          : MediaQuery.sizeOf(context).width * 0.75,
      elevation: 3,
      backgroundColor: CustomColor.primaryBGLightColor,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.clipart.drawerFrame.path,
            ),
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: ListView(
          children: [
            _appLogoWidget(context),
            _userInfoWidget(context),
            _drawerTitle(context),
          ],
        ).paddingSymmetric(horizontal: Dimensions.marginSizeHorizontal * 0.5),
      ),
    );
  }

  _userInfoWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Column(
      children: [
        Animate(
            effects: const [
              FadeEffect(),
              ScaleEffect(),
            ],
            child: Obx(
              () => ImagePickerWidget(
                isPicker: false,
                imageUrl: profileController.userImage.value,
              ),
            )),
        TitleHeading3Widget(
          fontSize: isTab()
              ? Dimensions.headingTextSize3 * 1.8
              : Dimensions.headingTextSize3,
          text: profileController.userFullName.value,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        )
            .paddingOnly(
              top: Dimensions.paddingSize * 0.5,
            )
            .animate()
            .fadeIn(duration: 900.ms, delay: 300.ms)
            .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
        TitleHeading4Widget(
          fontSize: isTab()
              ? Dimensions.headingTextSize2
              : Dimensions.headingTextSize4,
          text: profileController.userEmailAddress.value,
          opacity: 0.60,
          maxLines: 1,
          textOverflow: TextOverflow.ellipsis,
        )
            .paddingOnly(bottom: Dimensions.paddingSize * 0.8)
            .animate()
            .fadeIn(duration: 900.ms, delay: 300.ms)
            .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad),
      ],
    );
  }

  _appLogoWidget(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin: EdgeInsets.only(
          top: Dimensions.marginSizeVertical * 0.35,
          bottom: Dimensions.marginSizeVertical * 0.4),
      child: Row(
        children: [
          horizontalSpace(Dimensions.widthSize),
          InkWell(
            onTap: () {
              // Get.back();
              Get.close(1);
            },
            child: Icon(
              Icons.arrow_back,
              color: Get.isDarkMode
                  ? CustomColor.whiteColor
                  : CustomColor.blackColor,
              size: isTab() ? 15.sp : 20.sp,
            ),
          ),
          horizontalSpace(Dimensions.widthSize * 2),
          // const AppBasicLogo(scale: 22),
          Container(
            height: isTab()
                ? Dimensions.heightSize * 2.9
                : Dimensions.heightSize * 1.8,
            width: isTab()
                ? MediaQuery.sizeOf(context).width * 0.35
                : MediaQuery.sizeOf(context).width * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(controller.controller.siteLogo.value),
                fit: BoxFit.cover,
                scale: 1,
              ),
            ),
          )
        ],
      ).paddingOnly(
        bottom: Dimensions.paddingSizeVertical * 0.5,
        top: Dimensions.heightSize * 0.5,
      ),
    );
  }

  _drawerTitle(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Column(
        children: AnimateList(
      children: [
        verticalSpace(isTab() ? 0 : Dimensions.heightSize * 0.8),
        buildMenuItem(
          context,
          title: Strings.twoFaVerification,
          imagePath: Assets.icon.twoFa,
          onTap: () {
            debugPrint("true");
            Get.toNamed(Routes.twoFaScreen);
          },
        ),
        buildMenuItem(
          context,
          title: Strings.services,
          imagePath: Assets.icon.settings,
          onTap: () {
            controller.onServices;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.webJournal,
          imagePath: Assets.icon.book4,
          onTap: () {
            controller.onWebJournal;
          },
        ),
        Row(
          children: [
            buildMenuItem(
              context,
              title: Strings.language,
              imagePath: Assets.icon.gTranslate,
              onTap: () {},
            ),
            horizontalSpace(Dimensions.widthSize),
            Padding(
              padding:  EdgeInsets.only(bottom: Dimensions.heightSize),
              child: ChangeLanguageWidget(
                isHome: false,
              ),
            )
          ],
        ),
     buildMenuItem(
          context,
          title: Strings.changePassword,
          imagePath: Assets.icon.key,
          onTap: () {
            controller.onChangePassword;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.helpCenter,
          imagePath: Assets.icon.help,
          onTap: () {
            controller.onHelpCenter;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.privacyPolicy,
          imagePath: Assets.icon.encrypted,
          onTap: () {
            controller.onPrivacyAndPolicy;
          },
        ),
        buildMenuItem(
          context,
          title: Strings.aboutUs,
          imagePath: Assets.icon.info,
          onTap: () {
            controller.onAboutUs;
          },
        ),
        ////
        buildMenuItem(
          context,
          title: Strings.logOut,
          imagePath: Assets.icon.fa6SolidPowerOff,
          onTap: () {
            signOutDialog(
              context,
            );
          },
        ),
      ],
    ));
  }

  buildMenuItem(
    context, {
    required String title,
    required String imagePath,
    required VoidCallback onTap,
    double scaleImage = 1,
  }) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              horizontalSpace(isTab()
                  ? Dimensions.widthSize * 2
                  : Dimensions.widthSize * 1.4),
              Container(
                padding: EdgeInsets.all(Dimensions.paddingSize * 0.2),
                decoration: BoxDecoration(
                  color: CustomColor.primaryLightColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius * 0.8),
                ),
                child: CustomImageWidget(
                  path: imagePath,
                  height: isTab()
                      ? Dimensions.heightSize * 1.9
                      : Dimensions.heightSize * 1.7,
                  width: isTab()
                      ? Dimensions.widthSize * 2.4
                      : Dimensions.widthSize * 2,
                  color: CustomColor.whiteColor,
                ),
              ),
              horizontalSpace(Dimensions.widthSize),
              TitleHeading3Widget(
                fontSize: isTab()
                    ? Dimensions.headingTextSize1
                    : Dimensions.headingTextSize3,
                fontWeight: FontWeight.w600,
                text: title,
              ),
            ],
          ),
        ),
        verticalSpace(Dimensions.heightSize),
      ],
    )
        .animate()
        .fadeIn(duration: 900.ms, delay: 300.ms)
        .shimmer(blendMode: BlendMode.srcOver, color: Colors.white12)
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
  }

  signOutDialog(BuildContext context) {
      bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Dialog(
          
            // ignore: deprecated_member_use
            backgroundColor: Theme.of(context).colorScheme.background,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimensions.radius),
            ),
            child: Padding(
              padding: EdgeInsets.all(Dimensions.paddingSize),
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisSize: mainMin,
                children: [
                  TitleHeading2Widget(

                    fontSize: isTab()?Dimensions.headingTextSize1:Dimensions.headingTextSize2,
                    text: Strings.signOutAlert,
                    textAlign: TextAlign.start,
                  ),
                  verticalSpace(Dimensions.heightSize),
                   TitleHeading4Widget(
                                        fontSize: isTab()
                        ? Dimensions.headingTextSize3
                        : Dimensions.headingTextSize4,
                    text: Strings.areYouSure,
                    textAlign: TextAlign.start,
                    opacity: 0.80,
                  ),
                  verticalSpace(Dimensions.heightSize),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: CustomContainer(
                            height: Dimensions.buttonHeight * 0.7,
                            borderRadius: Dimensions.radius * 0.8,
                            color: Get.isDarkMode
                                ? CustomColor.primaryBGLightColor
                                    .withValues(alpha:0.15)
                                : CustomColor.primaryBGDarkColor
                                    .withValues(alpha:0.15),
                            child: const TitleHeading4Widget(
                              text: Strings.cancel,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      horizontalSpace(Dimensions.widthSize),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            signOutController.onSignOut;
                          },
                          child: Obx(
                            () => signOutController.isLoading
                                ? const CustomLoadingAPI()
                                : CustomContainer(
                                    height: Dimensions.buttonHeight * 0.7,
                                    borderRadius: Dimensions.radius * 0.8,
                                    color: Theme.of(context).primaryColor,
                                    child: const TitleHeading4Widget(
                                      text: Strings.okay,
                                      color: CustomColor.whiteColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                            // ),
                          ),
                        ),
                      )
                    ],
                  ).paddingAll(Dimensions.paddingSize * 0.5),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
