
import '../../../controller/drawer/notification_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/transaction/notification_screen_widget.dart';

class NotificationMobileScreenLayout extends StatelessWidget {
  NotificationMobileScreenLayout({
    super.key,
    required this.controller,
  });
  final NotificationController controller;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PrimaryAppBar(
        Strings.notification,
        iconBgColor: CustomColor.secondaryLightColor,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return  NotificationScreenWidget();
  }
}
