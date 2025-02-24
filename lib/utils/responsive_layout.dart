import 'package:flutter/material.dart';
import 'dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget tabletScaffold;

  const ResponsiveLayout({
    super.key,
    required this.mobileScaffold,
    required  this.tabletScaffold,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Dimensions.mobileScreenWidth) {
          return mobileScaffold;
        } else if (constraints.maxWidth > Dimensions.mobileScreenWidth) {
          return tabletScaffold;
        } else {
          return tabletScaffold;
        }
      },
    );
  }
}
