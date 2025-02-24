import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_in/sign_in_widget.dart';

class SignIndMobileScreenLayout extends StatelessWidget {
  const SignIndMobileScreenLayout({
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
    return SignInWidget();
  }
}
