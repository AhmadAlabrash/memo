import 'package:flutter/widgets.dart';

import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';
import '../text_labels/title_heading4_widget.dart';

class PaymentProofInfo extends StatelessWidget {
  const PaymentProofInfo(
      {super.key, required this.variable, required this.value});
  final String variable, value;
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Container(
      margin: EdgeInsets.only(top: Dimensions.marginSizeVertical * 0.2),
      child: Row(
        mainAxisAlignment: mainSpaceBet,
        children: [
          Expanded(
            flex: 5,
            child: TitleHeading4Widget(
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
              text: variable,
              fontSize: isTab()
                  ? Dimensions.headingTextSize3
                  : Dimensions.headingTextSize4,
              fontWeight: FontWeight.w500,
              color: CustomColor.secondaryLightTextColor,
            ),
          ),
          Expanded(
            flex: 4,
            child: TitleHeading4Widget(
              maxLines: 2,
              textAlign: TextAlign.end,
              textOverflow: TextOverflow.ellipsis,
              text: value,
              fontSize: isTab()
                  ? Dimensions.headingTextSize3 + 1
                  : Dimensions.headingTextSize4 + 1,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
