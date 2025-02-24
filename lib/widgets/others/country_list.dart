import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../backend/model/profile/profile_info_model.dart';
import '../../controller/navigation/profile_controller.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class CountryDropDown extends StatelessWidget {



   CountryDropDown({
  
    Key? key,
   
  }) : super(key: key);
  final  controller =Get.put(ProfileController()) ;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          height: Dimensions.inputBoxHeight * 0.75,
          decoration: BoxDecoration(
           color: CustomColor.inputFillLightTextColor,
            borderRadius: BorderRadius.circular(Dimensions.radius * 0.5),
          ),
          child: DropdownButtonHideUnderline(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 20),
              child: DropdownButton(
                menuMaxHeight: MediaQuery.sizeOf(context).height*0.6,
                dropdownColor: CustomColor.whiteColor,
                hint: Padding(
                  padding: EdgeInsets.only(left: Dimensions.paddingSize * 0.7),
                  child: Text(
                  controller.selectCountry.value,
                    style: GoogleFonts.inter(
                      fontSize: Dimensions.headingTextSize3-1,
                      fontWeight: FontWeight.w600,
                      color: CustomColor.primaryLightTextColor,
                    ),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: CustomColor.primaryLightTextColor,
                  ),
                ),
                isExpanded: true,
              
                underline: Container(),
                borderRadius: BorderRadius.circular(Dimensions.radius),
                items: controller.profileInfoModel.data.countries.map<DropdownMenuItem<Country>>((value) {
                  return DropdownMenuItem<Country>(
                    value: value,
                    child: Text(
                      value.name.toString(),
                      style: CustomStyle.lightHeading3TextStyle,
                    ),
                  );
                }).toList(),
                onChanged:(value){
                    // print('onChanged called with value: $value');
                    if (value != null) {
                      controller.selectCountry.value = value.name;
                      controller.selectCountryCode.value = value.mobileCode;
                      // print(
                          // 'Selected Country: ${controller.selectCountry.value}');
                      // print(
                          // 'Country Code: ${controller.selectCountryCode.value}');
                    }
                }
              ),
            ),
          ),
        ));
  }
}

