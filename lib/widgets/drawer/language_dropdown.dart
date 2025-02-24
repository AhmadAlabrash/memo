
// import 'package:dropdown_button2/dropdown_button2.dart';

// import '../../utils/basic_screen_imports.dart';

// abstract class DropdownModel {
//   String get title;
//   String get img;
// }

// class LanguageDropDown<T extends DropdownModel> extends StatefulWidget {
//   final String hint;
//   final String title;
//   final Color? borderColor;
//   final List<T> items;
//   final void Function(T?) onChanged;
//   final BoxBorder? border;
//   final double? fieldBorderRadius;
//   final Color? dropDownIconColor;
//   final Color? titleTextColor;
//   final Color? dropDownFieldColor;
//   final Color? dropDownColor;
//   final bool isExpanded;
//   final bool borderEnable;
//   final EdgeInsetsGeometry? padding;
//   final EdgeInsetsGeometry? margin;
//   final TextStyle? titleStyle;
//   final BorderRadiusGeometry? customBorderRadius;
//   const LanguageDropDown({
//     super.key,
//     required this.items,
//     required this.onChanged,
//     this.border,
//     this.fieldBorderRadius,
//     this.dropDownIconColor,
//     this.titleTextColor,
//     this.dropDownFieldColor,
//     this.isExpanded = true,
//     this.padding,
//     this.margin,
//     this.titleStyle,
//     this.borderColor,
//     this.dropDownColor,
//     required this.hint,
//     this.borderEnable = true,
//     this.title = '',
//     this.customBorderRadius,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _CustomDropDownState<T> createState() => _CustomDropDownState<T>();
// }

// class _CustomDropDownState<T extends DropdownModel>
//     extends State<LanguageDropDown<T>> {
//   T? _selectedItem;

//   @override
//   Widget build(BuildContext context) {
//     return widget.title != ''
//         ? Visibility(
//             visible: widget.title != '',
//             child: Column(
//               crossAxisAlignment: crossStart,
//               mainAxisSize: mainMin,
//               children: [
//                 TitleHeading4Widget(
//                   text: widget.title,
//                   fontWeight: FontWeight.w500,
//                 ).paddingOnly(bottom: Dimensions.marginBetweenInputTitleAndBox),
//                 _dropDown()
//               ],
//             ))
//         : _dropDown();
//   }

//   _dropDown() {
//     return Container(
//       height: Dimensions.inputBoxHeight * 0.75,
//       margin: widget.margin,
//       decoration: BoxDecoration(
//         color: widget.dropDownFieldColor ??
//             Theme.of(context).colorScheme.background,
//         // border: widget.borderEnable
//         //     ? widget.border ??
//         //         Border.all(
//         //           color: widget.borderColor ??
//         //               (_selectedItem != null
//         //                   ? Theme.of(context).primaryColor
//         //                   : CustomColor.whiteColor.withValues(alpha:0.15)),
//         //           width: 1.5,
//         //         )
//         //     : null,
//         borderRadius: widget.customBorderRadius ??
//             BorderRadius.circular(
//               widget.fieldBorderRadius ?? Dimensions.radius,
//             ),
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<T>(
          
//           dropdownStyleData: DropdownStyleData(
            
//             maxHeight: 300.h,
//           ),
//           hint: Text(
//             widget.hint,
//             style: GoogleFonts.inter(
//               color: widget.titleTextColor ??
//                   (Get.isDarkMode
//                       ? CustomColor.whiteColor.withValues(alpha:0.8)
//                       : CustomColor.blackColor.withValues(alpha:0.8)),
//               fontSize: Dimensions.headingTextSize1,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           value: _selectedItem,
//           // icon: Padding(
//           //   padding: const EdgeInsets.only(right: 4),
//           //   child: Icon(
//           //     Icons.arrow_drop_down_rounded,
//           //     color: widget.dropDownIconColor ??
//           //         (_selectedItem != null
//           //             ? Theme.of(context).primaryColor
//           //             : CustomColor.whiteColor.withValues(alpha:0.15)),
//           //   ),
//           // ),
//           style: TextStyle(
//             color: widget.titleTextColor ?? Theme.of(context).primaryColor,
//             fontSize: Dimensions.headingTextSize3,
//             fontWeight: FontWeight.w500,
//           ),
//           // dropdownColor: widget.dropDownColor ?? const Color(0xFF021A1B),
//           isExpanded: widget.isExpanded,
//           underline: Container(),
//           // borderRadius: BorderRadius.circular(Dimensions.radius),
//           onChanged: (T? newValue) {
//             setState(() {
//               _selectedItem = newValue;
//               widget.onChanged(_selectedItem);
//             });
//           },
//           items: widget.items.map<DropdownMenuItem<T>>(
//             (T value) {
//               return DropdownMenuItem<T>(
//                 value: value,
//                 child: TitleHeading1Widget(
//                  text: value.title,
//                 ),
//               );
//             },
//           ).toList(),
//         ),
//       ),
//     );
//   }
// }
