import 'package:flutter/services.dart';
import '/language/language_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../others/custom_image_widget.dart';

/// >>> Border Side Style
enum BSS {
  enabledBorder,
  b,
  disableBorder,
  focusedBorder,
  errorBorder,
  focusedErrorBorder
}

enum BorderStyle {
  outline,
  underline,
  none,
}

class PrimaryInputWidget extends StatefulWidget {
  final String hintText, label, phoneCode;
  final String? prefixIconPath;
  final int maxLines;
  final bool isValidator;
  final bool isPasswordField;
  final bool autoFocus;
  final bool readOnly;
  final bool isFilled;
  final bool showBorderSide;
  final bool validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double? padding;
  final double? radius;
  final double borderWidth;
  final Color? fillColor;
  final Color? shadowColor;
  final Function(String)? onChanged;
  final Decoration? customShapeDecoration;
  final EdgeInsetsGeometry? customPadding;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final AlignmentGeometry? alignment;
  final BorderStyle borderStyle;
  const PrimaryInputWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIconPath = "",
    this.phoneCode = "",
    this.isValidator = true,
    this.isPasswordField = false,
    this.isFilled = true,
    this.validator = false,
    this.autoFocus = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.borderWidth = 2,
    this.radius,
    this.customPadding,
    this.padding,
    required this.label,
    this.textInputType,
    this.inputFormatters,
    this.alignment,
    this.shadowColor,
    this.borderStyle = BorderStyle.outline,
    this.fillColor,
    this.showBorderSide = false,
    this.customShapeDecoration,
    this.onChanged,
  });
  @override
  State<PrimaryInputWidget> createState() => _PrimaryInputWidgetState();
}

class _PrimaryInputWidgetState extends State<PrimaryInputWidget> {
  bool isTab() {
    return MediaQuery.sizeOf(context).shortestSide >= 650;
  }

  FocusNode? focusNode;
  bool isVisibility = true;
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _buildTextFormFieldWidget(context),
          )
        : _buildTextFormFieldWidget(context);
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  _buildDecoration() {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    final controller = Get.put(LanguageController());
    return InputDecoration(
      hintText: controller.getTranslation(widget.hintText),
      hintStyle: GoogleFonts.inter(
        fontSize:
            isTab() ? Dimensions.headingTextSize1 : Dimensions.headingTextSize3,
        fontWeight: FontWeight.w500,
        color: CustomColor.inputHintLightTextColor,
      ),
      errorStyle: GoogleFonts.inter(
          fontSize: isTab()
              ? Dimensions.headingTextSize2
              : Dimensions.headingTextSize4),
      border: _setBorderStyle(BSS.b),
      enabledBorder: _setBorderStyle(BSS.enabledBorder),
      focusedBorder: _setBorderStyle(BSS.focusedBorder),
      disabledBorder: _setBorderStyle(BSS.disableBorder),
      errorBorder: _setBorderStyle(BSS.errorBorder),
      focusedErrorBorder: _setBorderStyle(BSS.focusedErrorBorder),
      prefixIcon: _setPrefixIcon(),
      // prefixIconConstraints: prefixConstraints,
      // suffixIconConstraints: suffixConstraints,
      suffixIcon: _setSuffixIcon(),
      fillColor: widget.fillColor ?? CustomColor.inputFillLightTextColor,
      filled: _setFilled(),
      isDense: true,
      contentPadding: _setPadding(),
    );
  }

  _buildTextFormFieldWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
        Container(
          decoration: _buildShapeDecoration(context),
          margin: EdgeInsets.zero,
          child: TextFormField(
            readOnly: widget.readOnly,
            controller: widget.controller,
            focusNode: focusNode,
            autofocus: widget.autoFocus,
            style: _setFontStyle(),
            inputFormatters: widget.inputFormatters,
            obscureText: widget.isPasswordField ? isVisibility : false,
            textInputAction: TextInputAction.next,
            keyboardType: widget.textInputType,
            maxLines: widget.maxLines,
            decoration: _buildDecoration(),
            validator: _setValidator(),
            cursorColor: CustomColor.primaryLightTextColor,
            onChanged: widget.onChanged,
            onTap: () {
              if (!widget.readOnly) {
                setState(() {
                  focusNode!.requestFocus();
                });
              }
            },
            onFieldSubmitted: (value) {
              if (!widget.readOnly) {
                setState(() {
                  focusNode!.unfocus();
                });
              }
            },
            onEditingComplete: () {
              if (!widget.readOnly) {
                setState(() {
                  focusNode!.unfocus();
                });
              }
            },
            onTapOutside: (value) {
              if (!widget.readOnly) {
                setState(() {
                  focusNode!.unfocus();
                });
              }
            },
          ),
        ),
      ],
    );
  }

  _buildTitle() {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitleHeadingWidget(
          text: widget.label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            fontSize: isTab()
                ? Dimensions.headingTextSize1
                : Dimensions.headingTextSize3,
            color: CustomColor.inputLabelLightTextColor,
          ),
        ),
        verticalSpace(isTab()
            ? Dimensions.marginBetweenInputBox * 0.4
            : Dimensions.marginBetweenInputTitleAndBox * 0.7),
      ],
    );
  }
                       
  _setBorderSide(borderSideStyle) {
    switch (borderSideStyle) {
      case BSS.enabledBorder:
        return BorderSide(
          width: widget.borderWidth,
          color: CustomColor.primaryLightTextColor.withValues(alpha:0.2),
        );
      case BSS.b:
        return BorderSide(
          width: widget.borderWidth,
          color: CustomColor.primaryLightTextColor.withValues(alpha:0.2),
        );
      case BSS.disableBorder:
        return BorderSide(
          width: widget.borderWidth,
          color: CustomColor.primaryLightTextColor.withValues(alpha:0.2),
        );
      case BSS.focusedBorder:
        return BorderSide(
          width: widget.borderWidth,
          color: Theme.of(context).primaryColor,
        );
      case BSS.errorBorder:
        return BorderSide(
          width: widget.borderWidth,
          color: Colors.red,
        );
      case BSS.focusedErrorBorder:
        return BorderSide(
          width: widget.borderWidth,
          color: Colors.red,
        );
      default:
        return BorderSide(
          width: widget.borderWidth,
          color: CustomColor.primaryLightTextColor.withValues(alpha:0.2),
        );
    }
  }

  _setBorderStyle(borderSideStyle) {
    switch (widget.borderStyle) {
      case BorderStyle.outline:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: widget.showBorderSide
              ? _setBorderSide(borderSideStyle)
              : BorderSide.none,
        );
      case BorderStyle.underline:
        return UnderlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: widget.showBorderSide
              ? _setBorderSide(borderSideStyle)
              : BorderSide.none,
        );

      case BorderStyle.none:
        return InputBorder.none;
      // ignore: unreachable_switch_default
      default:
        return OutlineInputBorder(
          borderRadius: _setOutlineBorderRadius(),
          borderSide: widget.showBorderSide
              ? _setBorderSide(borderSideStyle)
              : BorderSide.none,
        );
    }
  }

  _setFilled() {
    return widget.isFilled;
  }

  _setFontStyle() {
    return GoogleFonts.inter(
      fontSize:
          isTab() ? Dimensions.headingTextSize1 : Dimensions.headingTextSize3,
      fontWeight: FontWeight.w600,
      color: focusNode!.hasFocus
          ? CustomColor.primaryLightTextColor
          : CustomColor.primaryLightTextColor,
    );
  }

  _setOutlineBorderRadius() {
    return BorderRadius.circular(widget.radius ?? Dimensions.radius * 0.5);
  }

  _setPadding() {
    return widget.customPadding ??
        (widget.padding == null
            ? EdgeInsets.symmetric(
                horizontal: Dimensions.widthSize * 1.5,
                vertical: Dimensions.heightSize * 0.88,
              )
            : EdgeInsets.all(widget.padding!));
  }

  _setPrefixIcon() {
    return widget.prefixIcon ??
        (widget.prefixIconPath != ''
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSize * 0.4),
                child: Row(
                  mainAxisSize: mainMin,
                  children: [
                    CustomImageWidget(
                      path: widget.prefixIconPath!,
                      color: focusNode!.hasFocus
                          ? Theme.of(context).primaryColor
                          : Get.isDarkMode
                              ? CustomColor.primaryDarkTextColor
                                  .withValues(alpha:0.50)
                              : CustomColor.primaryLightTextColor
                                  .withValues(alpha:0.50),
                    ),
                    Visibility(
                      visible: widget.phoneCode != '',
                      child: Row(
                        children: [
                          Text(
                            widget.phoneCode,
                            style: TextStyle(
                              fontSize: Dimensions.headingTextSize3,
                              fontWeight: FontWeight.w500,
                              color: focusNode!.hasFocus
                                  ? Theme.of(context).primaryColor
                                  : CustomColor.primaryLightTextColor
                                      .withValues(alpha:0.2),
                            ),
                          ).marginOnly(
                            left: Dimensions.marginSizeHorizontal * 0.3,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: Dimensions.marginSizeHorizontal * 0.3,
                            ),
                            height: Dimensions.heightSize * 1.5,
                            width: 1,
                            color: focusNode!.hasFocus
                                ? Theme.of(context).primaryColor
                                : CustomColor.primaryLightTextColor
                                    .withValues(alpha:0.2),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : null);
  }

  _setSuffixIcon() {
    return widget.isPasswordField
        ? Padding(
            padding: EdgeInsets.only(
                right: isTab()
                    ? Dimensions.paddingSizeHorizontal * 0.3
                    : Dimensions.paddingSizeHorizontal * 0.1),
            child: IconButton(
              icon: Icon(
                isVisibility
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: focusNode!.hasFocus
                    ? CustomColor.primaryLightTextColor
                    : Get.isDarkMode
                        ? CustomColor.inputHintLightTextColor
                        : CustomColor.inputHintLightTextColor,
                size: isTab()
                    ? Dimensions.iconSizeDefault * 0.7
                    : Dimensions.iconSizeDefault * 1.2,
              ),
              onPressed: () {
                setState(() {
                  isVisibility = !isVisibility;
                });
              },
            ),
          )
        : widget.suffixIcon;
  }

  _setValidator() {
    final lController = Get.put(LanguageController());
    return widget.isValidator == false
        ? null
        : (String? value) {
            if (value!.isEmpty) {
              return lController.getTranslation(Strings.pleaseFillOutTheField);
            } else {
              return null;
            }
          };
  }

  _buildShapeDecoration(BuildContext context) {
    return ShapeDecoration(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
      ),
    );
  }
}
