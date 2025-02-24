import '../../backend/utils/custom_loading_api.dart';
import '../../controller/basic_settings/onboard_controller.dart';
import '../../utils/basic_screen_imports.dart';

class OnboardTabletScreenLayout extends StatelessWidget {
  OnboardTabletScreenLayout({
    super.key,
    required this.controller,
  });

  final OnboardController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        image: DecorationImage(
          image: NetworkImage(controller.onboardImageTab.value),
          fit: BoxFit.cover,
        ),
      ),
      child: _titleAndButtonWidget(context),
    );
  }

  _titleAndButtonWidget(context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 2.4),
      child: Column(
        mainAxisAlignment: mainEnd,
        children: [
          TitleHeading2Widget(
            text: controller.titleTab.value,
            fontSize: Dimensions.headingTextSize4-3,
            color: CustomColor.primaryLightTextColor,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
          ),
          verticalSpace(Dimensions.marginBetweenInputTitleAndBox * 0.5),
          TitleHeading4Widget(
            text: controller.subTitleTab.value,
            color: CustomColor.secondaryLightTextColor,
            fontWeight: FontWeight.w500,
            fontSize: Dimensions.headingTextSize6-6,
            textAlign: TextAlign.center,
          ),
          verticalSpace(Dimensions.heightSize),
          _buttonWidget(context),
          verticalSpace(Dimensions.heightSize * 6.3),
        ],
      ),
    );
  }

  _buttonWidget(context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: Dimensions.marginSizeHorizontal * 2),
      padding: EdgeInsets.only(
        bottom: MediaQuery.sizeOf(context).height * 0.09,
      ),
      child: PrimaryButton(
        fontSize: Dimensions.headingTextSize2,
        title: Strings.getStarted,
        onPressed: () {
          controller.onGetStarted;
        },
      ),
    );
  }
}
