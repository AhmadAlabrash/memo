import '../../backend/model/dashboard/transaction_model.dart';
import '../../backend/services/dashboard/dashboard_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';

class TransactionController extends GetxController {

    @override
  void onInit() {
    getTransactionApiProcess();
    super.onInit();
  }

  /// >> set loading process & Transaction Info Model
  final _isLoading = false.obs;
  late TransactionModel _transactionModel;

  /// >> get loading process & Transaction Info Model
  bool get isLoading => _isLoading.value;
  TransactionModel get transactionModel => _transactionModel;

  ///* Get Transaction info api process
  Future<TransactionModel> getTransactionApiProcess() async {
    _isLoading.value = true;
    update();
    await DashboardApiServices.transactionGetApiProcess().then((value) {
      _transactionModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _transactionModel;
  }
}
