import '/backend/model/dashboard/dashboard_model.dart';

import '../../backend/services/dashboard/dashboard_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';
import '../send_money/payment_gateway_controller.dart';

class DashboardController extends GetxController {
  final controller = Get.put(PaymentGatewayController());
  @override
  void onInit() {
    getDashboardApiProcess();
    super.onInit();
  }

  /// >> set loading process & dashboard Info Model
  final _isLoading = false.obs;
  late DashboardModel _dashboardModel;

  /// >> get loading process & dashboard Info Model
  bool get isLoading => _isLoading.value;
  DashboardModel get dashboardModel => _dashboardModel;

  ///* Get trade info api process
  Future<DashboardModel> getDashboardApiProcess() async {
    _isLoading.value = true;
    update();
    await DashboardApiServices.dashboardApiProcess().then((value) {
      _dashboardModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _dashboardModel;
  }
}
