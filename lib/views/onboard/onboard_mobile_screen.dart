import '/backend/utils/custom_loading_api.dart';

import '../../controller/basic_settings/onboard_controller.dart';
import '../../utils/basic_screen_imports.dart';

class OnboardMobileScreenLayout extends StatelessWidget {
  OnboardMobileScreenLayout({
    super.key,
    required this.controller,
  });

  final OnboardController controller;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.whiteColor,
      body: Obx(
        () => controller.isLoading
            ? const CustomLoadingAPI()
            : _bodyWidget(context),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSize),
      decoration: BoxDecoration(
       color: CustomColor.whiteColor,
        image: DecorationImage(
          image: NetworkImage(controller.onboardImage.value),
          fit: BoxFit.cover,
          
        ),
      ),
      child: _titleAndButtonWidget(context),
    );
  }

  _titleAndButtonWidget(context) {
    return Column(
      mainAxisAlignment: mainEnd,
      children: [
        verticalSpace(Dimensions.heightSize * 3.4),
        TitleSubTitleWidget(
          title: controller.title.value,
          subTitleFontSize: Dimensions.headingTextSize4,
          subTitle: controller.subTitle.value,
          isCenterText: true,
        ),
        verticalSpace(Dimensions.heightSize * 2),
        _buttonWidget(context),
                verticalSpace(Dimensions.heightSize * 2),
      ],
    );
  }

  _buttonWidget(context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 400;
    }
    return Padding(
      padding: EdgeInsets.only(
        bottom: isTab()
            ? MediaQuery.sizeOf(context).height * 0.05
            : MediaQuery.sizeOf(context).height * 0.02,
      ),
      child: PrimaryButton(
        title: Strings.getStarted,
        onPressed: () {
          controller.onGetStarted;
        },
      ),
    );
  }
}
