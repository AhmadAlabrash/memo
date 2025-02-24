import '../../../controller/navigation/profile_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/profile/profile_info_widget.dart';
import '../../../widgets/profile/profile_input_filed.dart';
import '../../../widgets/text_labels/title_heading5_widget.dart';

class ProfileTabScreenLayout extends StatelessWidget {
  ProfileTabScreenLayout({
    super.key,
    required this.controller,
  });

  final ProfileController controller;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      extendBodyBehindAppBar: false,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        Row(
          crossAxisAlignment: crossStart,
          children: [
            Expanded(
              flex: 4,
              child: _infoWidget(context),
            ),
            Expanded(
              flex: 7,
              child: _inputWidget(context),
            ),
          ],
        )
      ],
    );
  }

  _infoWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.paddingSizeHorizontal * 0.5,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          color: CustomColor.whiteColor),
      child: Column(
        children: [
          _imageWidget(context),
          _nameAndEmailWidget(context),
          DeleteButton(),
        ],
      ).paddingOnly(
        bottom: Dimensions.paddingSizeVertical * 1.5,
        top: Dimensions.paddingSizeVertical * 0.5,
      ),
    );
  }

  _imageWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal * 0.4),
      child: ProfileInfoWidget(controller: controller),
    );
  }

  _nameAndEmailWidget(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: Dimensions.paddingSizeVertical * 0.2),
      child: Column(
        children: [
          TitleHeading4Widget(text: controller.userFullName.value),
           TitleHeading5Widget(
            fontSize: Dimensions.headingTextSize6-2,
              color: CustomColor.secondaryLightTextColor,
              text: controller.userFullName.value),
        ],
      ),
    );
  }

//all input field here
  _inputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: Dimensions.marginSizeHorizontal * 0.5),
      padding: EdgeInsets.only(top: Dimensions.paddingSizeVertical * 0.5),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor.withValues(alpha:0.4),
        borderRadius: BorderRadius.circular(Dimensions.radius * 4),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 2),
            color: CustomColor.whiteColor),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Padding(
              padding:  EdgeInsets.only(
                top: Dimensions.paddingSizeVertical,
                left: Dimensions.paddingSizeVertical,
                right: Dimensions.paddingSizeVertical,
              ),
              child: TitleHeading1Widget(
                fontSize: Dimensions.headingTextSize6,
                text: Strings.profileInfoTitle),
            ),
            UpdateProfileFieldsWidget(
              controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}
