import '/language/language_controller.dart';
import '../../controller/drawer/change_password_controller.dart';
import '../../language/language_drop_down.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/change_password/change_password_widget.dart';
import '../../widgets/others/payment_information_widget.dart';

class SettingsTabScreen extends StatelessWidget {
  SettingsTabScreen({super.key});
  final controller = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: Dimensions.paddingSizeHorizontal * 2.4),
      children: [
        verticalSpace(Dimensions.heightSize * 0.5),
      
        _changeLanguage(context),
        verticalSpace(Dimensions.heightSize * 1.5),
        _changePassword(context),
      ],
    );
  }

  _changeLanguage(BuildContext context) {
    final languageController = Get.put(LanguageController());
    return Container(
      padding: EdgeInsets.all(Dimensions.paddingSize),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor,
        borderRadius: BorderRadius.circular(Dimensions.radius * 3),
      ),
      child: Column(crossAxisAlignment: crossStart, children: [
        Container(
            margin:
                EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.2),
            child: TitleHeading2Widget(
                fontSize: Dimensions.headingTextSize3 * 2,
                text: Strings.changeLanguage)),
        Container(
          width: MediaQuery.of(context).size.width,
          color: CustomColor.inputHintLightTextColor,
          child: const DottedDivider(),
        ),
 
        Padding(
          padding: EdgeInsets.only(
            top: Dimensions.paddingSizeVertical,
           
          ),
          child: TitleHeading1Widget(
              fontSize: Dimensions.headingTextSize1 * 1,
              color: CustomColor.secondaryLightTextColor,
              text: Strings.language),
        ),
           verticalSpace(Dimensions.heightSize*0.4),
        //! change language dropdown
        ChangeLanguageWidget(
          isHome: true,
        ),
        verticalSpace(Dimensions.heightSize),
        PrimaryButton(
          title: Strings.changeLanguage,
          onPressed: () {
            
              languageController.changeLanguage(languageController.rxNewValue.value);
            
          },
        )
      ]),
    );
  }

  _changePassword(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.paddingSizeVertical * 0.5),
      decoration: BoxDecoration(
        color: CustomColor.whiteColor.withValues(alpha:0.4),
        borderRadius: BorderRadius.circular(Dimensions.radius * 4),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Dimensions.paddingSizeVertical,
        ),
        decoration: BoxDecoration(
          color: CustomColor.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.radius * 3),
        ),
        child: Column(
          crossAxisAlignment: crossStart,
          children: [
            Container(
              padding: EdgeInsets.only(
                  right: Dimensions.paddingSizeHorizontal,
                  left: Dimensions.paddingSizeHorizontal),
              margin:
                  EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.2),
              child: TitleHeading2Widget(
                  fontSize: Dimensions.headingTextSize3 * 2,
                  text: Strings.changeLanguage),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.paddingSizeHorizontal,
                  right: Dimensions.paddingSizeHorizontal),
              width: MediaQuery.of(context).size.width,
              color: CustomColor.inputHintLightTextColor,
              child: const DottedDivider(),
            ),
            verticalSpace(Dimensions.heightSize),
            ChangePasswordScreenWidget(),
          ],
        ),
      ),
    );
  }
}
