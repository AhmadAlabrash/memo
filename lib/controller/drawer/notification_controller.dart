import '../../backend/model/dashboard/notification_info_model.dart';
import '../../backend/services/dashboard/dashboard_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';

class NotificationController extends GetxController {
  final notificationController = TextEditingController();
   @override
  void onInit() {
    getNotificationApiProcess();
    super.onInit();
  }

  /// >> set loading process & Notification Info Model
  final _isLoading = false.obs;
  late NotificationInfoModel _notificationInfoModel;

  /// >> get loading process & Notification Info Model
  bool get isLoading => _isLoading.value;
  NotificationInfoModel get notificationInfoModel => _notificationInfoModel;

  ///* Get trade info api process
  Future<NotificationInfoModel> getNotificationApiProcess() async {
    _isLoading.value = true;
    update();
    await DashboardApiServices.notificationGetApiProcess().then((value) {
      _notificationInfoModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _notificationInfoModel;
  }
}
