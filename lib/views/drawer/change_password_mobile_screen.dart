import '../../controller/drawer/change_password_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/change_password/change_password_widget.dart';

class ChangePasswordMobileScreenLayout extends StatelessWidget {
  ChangePasswordMobileScreenLayout({
    super.key,
    required this.controller,
  });
  final ChangePasswordController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PrimaryAppBar(
        Strings.changePassword,
        iconBgColor: CustomColor.secondaryLightColor,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ChangePasswordScreenWidget();
  }
}
