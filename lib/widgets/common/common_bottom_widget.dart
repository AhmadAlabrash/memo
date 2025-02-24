import 'package:flutter/material.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';

class BottomContainerWidget extends StatelessWidget {
  const BottomContainerWidget(
    context, {
    super.key,
    required this.child,
    this.height,
  });
  final Widget child;
  final double? height;
  // final double heightStack;
  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 650;
    }

    return Stack(
      alignment: Alignment.topCenter,
      children: [
           Container(
          height: height!,
          margin: EdgeInsets.symmetric(
              horizontal:
                  isTablet() ? Dimensions.marginSizeHorizontal * 1.3 : Dimensions.marginSizeHorizontal*0.85),
          decoration: BoxDecoration(
            color: CustomColor.whiteColor.withValues(alpha:0.4),
            borderRadius: BorderRadius.circular(Dimensions.radius * 2),
          ),
        ),
        Container(
          height: height!,
    margin: EdgeInsets.only(top: Dimensions.marginSizeVertical*0.31),
          decoration: BoxDecoration(
            color: CustomColor.whiteColor,
            borderRadius: BorderRadius.circular(Dimensions.radius * 3),
          ),
          padding: EdgeInsets.all(Dimensions.paddingSize * 0.8),
          child: child,
        ),
        
      
        
      ],
    );
  }
}
