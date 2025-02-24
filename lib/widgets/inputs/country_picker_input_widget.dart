import 'package:country_code_picker/country_code_picker.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../controller/navigation/profile_controller.dart';

class ProfileCountryCodePickerWidget extends StatelessWidget {
  const ProfileCountryCodePickerWidget({
    super.key,
    required this.controller,
    this.keyboardType,
    this.onChanged,
  });

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final updateProfileController = Get.put(ProfileController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleHeadingWidget(
          text: Strings.country,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: isTab()
                ? Dimensions.headingTextSize1
                : Dimensions.headingTextSize3,
            color: CustomColor.inputLabelLightTextColor,
          ),
        ),
        verticalSpace(Dimensions.marginBetweenInputTitleAndBox),
        Container(
          padding: EdgeInsets.only(
            left: Dimensions.paddingSizeHorizontal * 0.5,
            right: Dimensions.paddingSizeHorizontal * 0.1,
            top: isTab() ? Dimensions.paddingSizeVertical * 0.4 : 0,
            bottom: isTab() ? Dimensions.paddingSizeVertical * 0.4 : 0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
            color: CustomColor.inputFillLightTextColor,
          ),
          width: double.infinity,
          child: CountryCodePicker(
            countryList: updateProfileController.jsonList,
            padding: EdgeInsets.all(Dimensions.paddingSize * 0.1),
            textStyle: Get.isDarkMode
                ? CustomStyle.darkHeading3TextStyle
                : GoogleFonts.inter(
                    fontSize: isTab()
                        ? Dimensions.headingTextSize1
                        : Dimensions.headingTextSize3,
                    fontWeight: FontWeight.w600,
                    color: CustomColor.primaryLightTextColor,
                  ),
            onChanged: (value) {
              updateProfileController.countryController.text =
                  value.name.toString();
              debugPrint(updateProfileController.countryController.text);
              updateProfileController.selectCountryCode.value =
                  value.dialCode.toString();
              debugPrint(updateProfileController.selectCountryCode.value);
            },
            showOnlyCountryWhenClosed: true,
            showFlag: false,
            showDropDownButton: true,
            initialSelection: updateProfileController.countryController.text,
            backgroundColor: Colors.transparent,
            showCountryOnly: true,
            alignLeft: true,
            searchStyle: Get.isDarkMode
                ? CustomStyle.darkHeading4TextStyle
                : CustomStyle.lightHeading4TextStyle,
            dialogTextStyle: Get.isDarkMode
                ? CustomStyle.darkHeading4TextStyle
                : CustomStyle.lightHeading4TextStyle,
            onInit: (code) => {
              updateProfileController.countryController.text =
                  code!.name.toString(),
              debugPrint(updateProfileController.countryController.text),
              updateProfileController.selectCountryCode.value =
                  code.dialCode.toString(),
              debugPrint(updateProfileController.selectCountryCode.value),
            },
          ),
        ),
      ],
    );
  }
}
