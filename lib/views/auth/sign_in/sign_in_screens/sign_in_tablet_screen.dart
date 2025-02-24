import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_in/sign_in_widget.dart';

class SignInTabletScreenLayout extends StatelessWidget {
  const SignInTabletScreenLayout({
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
        child: SignInWidget());
  }
}
