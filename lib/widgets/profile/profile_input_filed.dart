import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import '../../language/language_controller.dart';
import '../others/country_list.dart';
import '/backend/utils/custom_loading_api.dart';
import '../../controller/auth/sign_out_and_delete/delete_controller.dart';
import '../others/custom_container.dart';
import '/widgets/buttons/primary_button.dart';
import '../../controller/navigation/profile_controller.dart';
import '../../utils/basic_widget_imports.dart';
import '../inputs/primary_text_input_area_widget.dart';

class UpdateProfileFieldsWidget extends StatelessWidget {
  UpdateProfileFieldsWidget({super.key, required this.controller});
  final formKey = GlobalKey<FormState>();
  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.all(Dimensions.paddingSizeHorizontal * 0.8),
        child: Column(
          mainAxisSize: mainMin,
          children: [
            _firstNameAndLastNameWidget(context),
            _countryWidget(context),
            _phoneNumberWidget(context),
            _addressAndCityWidget(context),
            _stateAndZipCodeWidget(context),
            _buttonWidget(context),
          ],
        ),
      ),
    );
  }

  _firstNameAndLastNameWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.firstNameController,
            hintText: Strings.firstName,
            label: Strings.firstName,
            textInputType: TextInputType.text,
          ),
        ),
        horizontalSpace(Dimensions.widthSize),
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.lastNameController,
            hintText: Strings.lastName,
            label: Strings.lastName,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.7);
  }

  _countryWidget(BuildContext context) {
        return Column(
          crossAxisAlignment: crossStart,
          children: [
              CustomTitleHeadingWidget(
              text: Strings.country,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,

                    fontSize: Dimensions.headingTextSize3,
                color: CustomColor.inputLabelLightTextColor,
              ),
            ),
            verticalSpace( Dimensions.marginBetweenInputTitleAndBox * 0.7),
            CountryDropDown(
              // selectMethod: controller.selectedSendingCountry,
              // itemsList: controller.sendingCountryList,
              // onChanged: (value) {
              //   controller.selectedSendingCountry.value = value!.name;
              //   controller.selectCountryCode.value = value.mobileCode;
                //  controller. receiverCountry =value;
              // },
            ),
            verticalSpace(Dimensions.heightSize),
          ],
        );
    //     ProfileCountryCodePickerWidget(
    //   controller: controller.countryController,
    // ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75);
  }

  _phoneNumberWidget(BuildContext context) {
    return Obx(
      () => PrimaryInputWidget(
        isFilled: true,
        // padding: ,
        prefixIcon: Container(
          margin: EdgeInsets.only(
            right: Get.find<LanguageController>().languageDirectionText.value ==
                    "ltr"
                ? Dimensions.paddingSizeHorizontal * 0.6
                : 0,
            left: Get.find<LanguageController>().languageDirectionText.value ==
                    "rtl"
                ? Dimensions.paddingSizeHorizontal * 0.6
                : 0,
          ),
          padding: EdgeInsets.symmetric(
              vertical: Dimensions.paddingSizeVertical * 0.4),
          alignment: Alignment.center,
          width: Dimensions.widthSize * 6,
          decoration: BoxDecoration(
            color: CustomColor.primaryLightColor,
            borderRadius: BorderRadius.only(
              bottomLeft:
                  Get.find<LanguageController>().languageDirectionText.value ==
                          "ltr"
                      ? Radius.circular(Dimensions.radius * 0.7)
                      : const Radius.circular(0),
              topLeft:
                  Get.find<LanguageController>().languageDirectionText.value ==
                          "ltr"
                      ? Radius.circular(Dimensions.radius * 0.7)
                      : const Radius.circular(0),
              topRight:
                  Get.find<LanguageController>().languageDirectionText.value ==
                          "rtl"
                      ? Radius.circular(Dimensions.radius * 0.7)
                      : const Radius.circular(0),
              bottomRight:
                  Get.find<LanguageController>().languageDirectionText.value ==
                          "rtl"
                      ? Radius.circular(Dimensions.radius * 0.7)
                      : const Radius.circular(0),
            ),
          ),
          child: CustomTitleHeadingWidget(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeHorizontal * 0.1),
            text: controller.selectCountryCode.value,
            style: GoogleFonts.inter(
              color: CustomColor.whiteColor,
              fontSize: Dimensions.headingTextSize3,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        controller: controller.phoneNumberController,
        hintText: Strings.phoneNumber,
        label: Strings.phoneNumber,
        fillColor: CustomColor.inputFillLightTextColor,
        textInputType: TextInputType.number,
        customPadding: EdgeInsets.only(
          top: Dimensions.paddingSizeVertical * 0.2,
          bottom: Dimensions.paddingSizeVertical * 0.2,
          left: Dimensions.paddingSizeHorizontal * 0.4,
        ),
        phoneCode: controller.selectCountryCode.value,
      ),
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75);
  }

  _addressAndCityWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryInputWidget(
            isFilled: true,
            controller: controller.addressController,
            hintText: Strings.enterAddress,
            label: Strings.address,
            textInputType: TextInputType.text,
          ),
        ),
        horizontalSpace(Dimensions.widthSize),
        Expanded(
          child: PrimaryInputWidget(
            isFilled: true,
            controller: controller.sateController,
            hintText: Strings.enterState,
            label: Strings.state,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75);
  }

  _stateAndZipCodeWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.cityController,
            hintText: Strings.enterCity,
            label: Strings.city,
            textInputType: TextInputType.text,
          ),
        ),
        horizontalSpace(Dimensions.widthSize),
        Expanded(
          child: PrimaryInputWidget(
            controller: controller.zipCodeController,
            hintText: Strings.enterZip,
            label: Strings.zIPCode,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    ).paddingOnly(bottom: Dimensions.marginSizeVertical);
  }

  _buttonWidget(BuildContext context) {
    return Column(
      children: [
        Obx(() => controller.isUpdateLoading
            ? const CustomLoadingAPI()
            : PrimaryButton(
                title: Strings.profileUpdate,
                onPressed: () {
                  controller.onUpdateProfile;
                })),
      ],
    );
  }
}

class DeleteButton extends StatelessWidget {
  DeleteButton({super.key});
  final controller = Get.put(DeleteController());
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isTab()
            ? Dimensions.paddingSizeHorizontal * 0.6
            : Dimensions.paddingSizeHorizontal * 0.8,
      ),
      child: PrimaryButton(
          borderColor: CustomColor.redColor,
          buttonColor: CustomColor.redColor,
          title: Strings.deleteAccount,
          onPressed: () {
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
                    backgroundColor: Theme.of(context).colorScheme.surface,
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
                            fontSize: isTab() ?Dimensions.headingTextSize1:Dimensions.headingTextSize2,
                            text: Strings.deleteAccountAlert,
                            textAlign: TextAlign.start,
                          ),
                          verticalSpace(Dimensions.heightSize),
                           TitleHeading4Widget(
                                  fontSize: isTab()
                                ? Dimensions.headingTextSize3
                                : Dimensions.headingTextSize4,
                            text: Strings.areYourSureDelete,
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
                                      text: Strings.no,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              horizontalSpace(Dimensions.widthSize),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    controller.onDeletes;
                                  },
                                  child: Obx(
                                    () => controller.isLoading
                                        ? const CustomLoadingAPI()
                                        : CustomContainer(
                                            height:
                                                Dimensions.buttonHeight * 0.7,
                                            borderRadius:
                                                Dimensions.radius * 0.8,
                                            color:
                                                Theme.of(context).primaryColor,
                                            child: const TitleHeading4Widget(
                                              text: Strings.yes,
                                              color: CustomColor.whiteColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                    // ),
                                  ),
                                ),
                              ),
                            ],
                          ).paddingAll(Dimensions.paddingSize * 0.5),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
