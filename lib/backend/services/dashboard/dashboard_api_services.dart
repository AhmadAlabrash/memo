import '../../model/dashboard/dashboard_model.dart';
import '../../model/dashboard/notification_info_model.dart';
import '../../model/dashboard/transaction_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class DashboardApiServices {
  ///* Notification get process api
  static Future<DashboardModel?> dashboardApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.dashboardURL,
        code: 200,
      );
      if (mapResponse != null) {
        DashboardModel result = DashboardModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from dashboard get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* Notification get process api
  static Future<NotificationInfoModel?> notificationGetApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.notificationURL,
        code: 200,
      );
      if (mapResponse != null) {
        NotificationInfoModel result =
            NotificationInfoModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Notification get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* transaction get process api
  static Future<TransactionModel?> transactionGetApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.transactionURL,
        code: 200,
      );
      if (mapResponse != null) {
        TransactionModel result =
            TransactionModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Transaction get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
