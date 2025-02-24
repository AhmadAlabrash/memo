import '../../../../utils/basic_screen_imports.dart';
import '../../../../widgets/auth/sign_up/sign_up_widget.dart';

class SignUpMobileScreenLayout extends StatelessWidget {
  const SignUpMobileScreenLayout({
 super.key,});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryLightColor,
      body: _bodyWidget(context),
    );
  }
  _bodyWidget(BuildContext context) {
    return SignUpWidget();
  }
}
