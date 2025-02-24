import '../../../../utils/basic_widget_imports.dart';
import '../../../../widgets/auth/sign_up/sign_up_widget.dart';

class SignUpTabletScreenLayout extends StatelessWidget {
  const SignUpTabletScreenLayout({
    super.key,
 
  });
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
       margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSizeHorizontal * 1.2,
        ),
      child: SignUpWidget());
  }
}
