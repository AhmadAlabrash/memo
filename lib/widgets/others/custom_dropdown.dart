import 'package:dropdown_button2/dropdown_button2.dart';

import '/backend/services/api_endpoint.dart';
import '/controller/send_money/payment_gateway_controller.dart';
import '../../../utils/basic_screen_imports.dart';

abstract class DropdownModel {
  String get title;
  String get img;
  int get paymentGatewayId;
}

class CustomDropDown<T extends DropdownModel> extends StatefulWidget {
  final String hint;
  final String hintImage;
  final String title;
  final Color? borderColor;
  final List<T> items;
  final void Function(T?) onChanged;
  final BoxBorder? border;
  final double? fieldBorderRadius;
  final Color? dropDownIconColor;
  final Color? titleTextColor;
  final Color dropDownFieldColor;
  final Color? dropDownColor;
  final bool isExpanded;
  final bool borderEnable;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? titleStyle;
  final BorderRadiusGeometry? customBorderRadius;
  const CustomDropDown({
    super.key,
    required this.items,
    required this.onChanged,
    this.border,
    this.fieldBorderRadius,
    this.dropDownIconColor,
    this.titleTextColor,
    this.dropDownFieldColor = Colors.transparent,
    this.isExpanded = true,
    this.padding,
    this.margin,
    this.titleStyle,
    this.borderColor,
    this.dropDownColor,
    required this.hint,
    this.borderEnable = true,
    this.title = '',
    this.customBorderRadius,
    required this.hintImage,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomDropDownState<T> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T extends DropdownModel>
    extends State<CustomDropDown<T>> {
  T? _selectedItem;
  bool isTab() {
    return MediaQuery.sizeOf(context).shortestSide >= 650;
  }

  final controller = Get.put(PaymentGatewayController());
  @override
  Widget build(BuildContext context) {
    return widget.title != ''
        ? Visibility(
            visible: widget.title != '',
            child: Column(
              crossAxisAlignment: crossStart,
              mainAxisSize: mainMin,
              children: [
                TitleHeading4Widget(
                  text: widget.title,
                  fontWeight: FontWeight.w500,
                ).paddingOnly(bottom: Dimensions.marginBetweenInputTitleAndBox),
                _dropDown()
              ],
            ))
        : _dropDown();
  }

  _dropDown() {
    var data = controller.paymentGatewayModel.data.imagePaths.pathLocation;
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      alignment: Alignment.center,
      height: isTab()
          ? Dimensions.inputBoxHeight * 0.6
          : Dimensions.inputBoxHeight * 0.72,
      decoration: BoxDecoration(
        color: widget.dropDownFieldColor,
        border: widget.borderEnable
            ? widget.border ??
                Border.all(
                  color: widget.borderColor ??
                      (_selectedItem != null
                          ? Theme.of(context).primaryColor
                          : CustomColor.whiteColor.withValues(alpha:0.15)),
                  width: 1.5,
                )
            : null,
        borderRadius: widget.customBorderRadius ??
            BorderRadius.circular(
              widget.fieldBorderRadius ?? Dimensions.radius * 0.5,
            ),
      ),
      child: DropdownButton2<T>(
        underline: Container(
          // margin: EdgeInsets.only(
          //   top: Dimensions.paddingSizeVertical*0.7,

          // ),
          color: CustomColor.primaryLightTextColor.withValues(alpha:0.5),
          height: 0.9,
          width: MediaQuery.sizeOf(context).width,
        ),
        dropdownStyleData: DropdownStyleData(
            maxHeight: MediaQuery.sizeOf(context).height * 0.5,
            padding: EdgeInsets.symmetric(
                vertical: Dimensions.paddingSizeVertical * 0.2)),
        // iconEnabledColor: CustomColor.primaryLightTextColor,
        // iconDisabledColor: CustomColor.primaryLightTextColor,
        // menuMaxHeight: MediaQuery.sizeOf(context).height * 0.45,
        // decoration: const InputDecoration(
        //   focusedBorder: UnderlineInputBorder(
        //     borderSide: BorderSide(color: CustomColor.secondaryLightTextColor),
        //   ),
        //   enabledBorder: UnderlineInputBorder(
        //     borderSide: BorderSide(color: CustomColor.secondaryLightTextColor),
        //   ),
        // ),
        // padding: EdgeInsets.zero,
        hint: Padding(
          padding:
              EdgeInsets.only(bottom: Dimensions.paddingSizeVertical * 0.5),
          child: Row(
            children: [
              Container(
                height: 37.h,
                width: 37.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.hintImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomTitleHeadingWidget(
                padding: EdgeInsets.only(
                    left: Dimensions.paddingSizeHorizontal * 0.3),
                text: widget.hint,
                style: GoogleFonts.inter(
                  fontSize: isTab()
                      ? Dimensions.headingTextSize2 + 2
                      : Dimensions.headingTextSize3 - 2,
                  color: CustomColor.primaryLightTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        value: _selectedItem,
        // icon: Padding(
        //   padding: const EdgeInsets.only(right: 4),
        //   child: Icon(
        //     Icons.arrow_drop_down_rounded,
        //     color: widget.dropDownIconColor ??
        //         (_selectedItem != null
        //             ? CustomColor.primaryLightTextColor
        //             : CustomColor.primaryLightTextColor),
        //   ),
        // ),
        style: GoogleFonts.inter(
          color: widget.titleTextColor ?? Theme.of(context).primaryColor,
          fontSize: isTab()
              ? Dimensions.headingTextSize1
              : Dimensions.headingTextSize3,
          fontWeight: FontWeight.w500,
        ),
        // dropdownColor: widget.dropDownColor ?? const Color(0xFF021A1B),
        isExpanded: widget.isExpanded,
        // borderRadius: BorderRadius.circular(Dimensions.radius),
        onChanged: (T? newValue) {
          setState(() {
            _selectedItem = newValue;
            widget.onChanged(_selectedItem);
          });
        },
        items: widget.items.map<DropdownMenuItem<T>>(
          (T value) {
            return DropdownMenuItem<T>(
              alignment: Alignment.center,
              value: value,
              child: Padding(
                padding: EdgeInsets.only(
                  left: Dimensions.paddingSizeHorizontal * 0.2,
                  right: Dimensions.paddingSizeHorizontal * 0.2,
                  bottom: Dimensions.paddingSizeHorizontal * 0.5,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 37.h,
                      width: 37.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            "${ApiEndpoint.mainDomain}/$data/${value.img}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    horizontalSpace(Dimensions.widthSize),
                    CustomTitleHeadingWidget(
                      text:
                          "${value.title} ${controller.getType(value.paymentGatewayId)}",
                      style: GoogleFonts.inter(
                        fontSize: isTab()
                            ? Dimensions.headingTextSize2 + 2
                            : Dimensions.headingTextSize3 - 2,
                        color: CustomColor.primaryLightTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
