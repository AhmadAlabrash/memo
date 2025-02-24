import '../../../controller/drawer/notification_controller.dart';
import '../../../utils/basic_screen_imports.dart';
import '../../../widgets/transaction/notification_screen_widget.dart';

class NotificationTabScreenLayout extends StatelessWidget {
  const NotificationTabScreenLayout({
    super.key,
    required this.controller,
  });
  final NotificationController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.h,
          backgroundColor: CustomColor.whiteColor,
          scrolledUnderElevation: 0,
          leading: Padding(
            padding:  EdgeInsets.only(left: Dimensions.paddingSizeHorizontal*0.2),
            child: BackButtonWidget(onTap: () {
              Get.back();
            }),
          ),
          leadingWidth: 35.w,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.all(Dimensions.paddingSize * 1.2),
            child: TitleHeading4Widget(
              text: Strings.notification,
              fontWeight: FontWeight.w600,
              color: CustomColor.primaryLightTextColor,
              fontSize: Dimensions.headingTextSize3 * 2,
            ),
          )),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return  NotificationScreenWidget();
  }
}
