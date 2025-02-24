import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../backend/utils/custom_loading_api.dart';
import '../../controller/drawer/notification_controller.dart';
import '../../utils/basic_screen_imports.dart';
import '../navigation/notification_widget.dart';
import '../others/animation_custom_view.dart';

class NotificationScreenWidget extends StatelessWidget {
  NotificationScreenWidget({super.key});
  final controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading
          ? const CustomLoadingAPI()
          : RefreshIndicator(
              color: Theme.of(context).primaryColor,
              onRefresh: () async {
                controller.getNotificationApiProcess();
              },
              child: AnimationLimiter(
                child:
                    controller.notificationInfoModel.data.notifications.isEmpty
                        ? const Center(
                            child: TitleHeading3Widget(
                                text: Strings.noNotificationFound))
                        : ListView(
                            physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            children: List.generate(
                              controller.notificationInfoModel.data
                                  .notifications.length,
                              (index) => CustomListViewAnimation(
                                index: index,
                                child: NotificationWidget(
                                  data: controller.notificationInfoModel.data
                                      .notifications[index],
                                ),
                              ),
                            ),
                          ),
              ).paddingSymmetric(
                  horizontal: Dimensions.marginSizeHorizontal * 0.8),
            ),
    );
  }
}
