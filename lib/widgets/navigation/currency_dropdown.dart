import '../../utils/basic_widget_imports.dart';
import '../others/currency2_dropdown.dart';

class CurrencyCode implements DropdownsModel {
  @override
  @override
  // ignore: override_on_non_overriding_member
  String title, img;
  CurrencyCode({
    required this.img,
    required this.title,
  });
}

class CurrencyDropDown extends StatelessWidget {
  const CurrencyDropDown({
    Key? key,
    this.isSellCurrency = true,
    this.isRounded = false,
  }) : super(key: key);
  final bool isSellCurrency, isRounded;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.inputBoxHeight * (isRounded ? 0.5 : 0.4),
      child: Currency2DropDown<CurrencyCode>(
        items: [
          CurrencyCode(img: "img", title: "USD"),
          CurrencyCode(img: "img", title: "USD"),
        ],
        hint: 'USD',
        onChanged: (value) {},
        isExpanded: false,
        padding: EdgeInsets.only(
          left: Dimensions.paddingSize * 0.25,
        ),
        titleTextColor: Theme.of(context).colorScheme.surface,
       
        dropDownColor: CustomColor.whiteColor,
        dropDownFieldColor: Theme.of(context).primaryColor,
        dropDownIconColor: Theme.of(context).colorScheme.surface,
        customBorderRadius: isRounded
            ? BorderRadius.circular(Dimensions.radius * 2)
            : BorderRadius.only(
                topRight: Radius.circular(Dimensions.radius * 0.5),
                bottomRight: Radius.circular(Dimensions.radius * 0.5),
              ),
      ),
    );
  }
}
