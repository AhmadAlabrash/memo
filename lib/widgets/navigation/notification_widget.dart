

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '/utils/custom_style.dart';

import '../../backend/model/dashboard/notification_info_model.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/size.dart';
import '../text_labels/custom_title_heading_widget.dart';
import '../text_labels/title_heading3_widget.dart';

class NotificationWidget extends StatelessWidget {
   NotificationWidget({
    super.key, required this.data
  });

  final day = DateFormat('dd');
  final month = DateFormat('MMMM');
  final Notifications data;

  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.marginSizeVertical * 0.3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          color: CustomColor.inputFillLightTextColor,
        ),
        padding: EdgeInsets.only(right: Dimensions.paddingSize * 0.1),
        child: Row(
          children: [
            Expanded(
                flex:isTab()? 1:2,
                child: Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.marginSizeVertical * 0.4,
                    top: Dimensions.marginSizeVertical * 0.45,
                    bottom: Dimensions.marginSizeVertical * 0.4,
                    right: Dimensions.marginSizeVertical * 0.3,
                  ),
                  padding: EdgeInsets.only(
                    left: 
                    Dimensions.paddingSize * 0.08,
                     right: Dimensions.paddingSize * 0.08,
                              top: Dimensions.paddingSize * 0.2,
                              bottom: Dimensions.paddingSize * 0.3,
                    ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: CustomColor.whiteColor,
                    borderRadius:
                        BorderRadius.circular(Dimensions.radius * 0.6),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTitleHeadingWidget(
                        text: day.format(data.createdAt),
                        style: CustomStyle.darkHeading4TextStyle.copyWith(
                            fontSize: isTab()
                                ? Dimensions.headingTextSize3 * 2
                                : Dimensions.headingTextSize1,
                            fontWeight: FontWeight.w800,
                            color: CustomColor.primaryLightTextColor),
                      ),
                      CustomTitleHeadingWidget(
                        textAlign: TextAlign.center,
                        padding: EdgeInsets.zero,
                        text: month.format(data.createdAt),
                        maxLines: 1,
                        textOverflow: TextOverflow.ellipsis,
                        style: CustomStyle.darkHeading4TextStyle.copyWith(
                            fontSize: isTab()
                                ? Dimensions.headingTextSize3
                                : Dimensions.headingTextSize6,
                            fontWeight: FontWeight.w500,
                            color: CustomColor.secondaryLightTextColor),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: crossStart,
                mainAxisAlignment: mainCenter,
                children: [
                  TitleHeading3Widget(
                    text: data.message.title,
                    fontSize: isTab()
                        ? Dimensions.headingTextSize1
                        : Dimensions.headingTextSize3,
                  ),
                  verticalSpace(Dimensions.heightSize * 0.2),
                  CustomTitleHeadingWidget(
                    text:  data.message.message,
                    maxLines: 4,
                    textOverflow: TextOverflow.ellipsis,
                    style: CustomStyle.darkHeading4TextStyle.copyWith(
                        fontSize: isTab()
                            ? Dimensions.headingTextSize6
                            : Dimensions.headingTextSize6-2,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.secondaryLightTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
