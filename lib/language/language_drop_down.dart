import 'package:dropdown_button2/dropdown_button2.dart';

import '../utils/basic_screen_imports.dart';
import 'language_controller.dart';

class ChangeLanguageWidget extends StatelessWidget {
  ChangeLanguageWidget({super.key, this.isHome = false});
  final bool isHome;
  final _languageController = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => !isHome
          ? _dropDown(context)
          : Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSize * 0.5,
              ),
              decoration: BoxDecoration(
                color: CustomColor.inputFillLightTextColor,
                borderRadius: BorderRadius.circular(Dimensions.radius*0.5),
              ),
              child: DropdownButton2<String>(
                underline: Container(),
                value:  _languageController.rxNewValue.value,
                isExpanded: true,
                // underline: isHome ? Container() : Container(),
                style: Get.isDarkMode
                    ? CustomStyle.darkHeading4TextStyle
                    : CustomStyle.lightHeading4TextStyle,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    _languageController.rxNewValue.value = newValue;
                  }
                },
                items:
                    _languageController.languages.map<DropdownMenuItem<String>>(
                  (language) {
                    return DropdownMenuItem<String>(
                      value: language.code,
                      child: Text(
                         language.name,
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
    );
  }

  _dropDown(BuildContext context) {
    return DropdownButton<String>(
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      value: _languageController.selectedLanguage.value,
      underline: !isHome ? Container() : null,
      style: Get.isDarkMode
          ? CustomStyle.darkHeading4TextStyle
          : CustomStyle.lightHeading4TextStyle,
      icon: Icon(
        Icons.arrow_drop_down_rounded,
        color: isHome ? CustomColor.primaryLightTextColor : null,
      ),
      onChanged: (String? newValue) {
        if (newValue != null) {
          _languageController.changeLanguage(newValue);
        }
      },
      items: _languageController.languages.map<DropdownMenuItem<String>>(
        (language) {
          return DropdownMenuItem<String>(
            value: language.code,
            child: Text(
             language.code.toUpperCase(),
            ),
          );
        },
      ).toList(),
    );
  }
}
