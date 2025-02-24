import '../../model/common/common_success_model.dart';
import '../../model/transfer/tatum_model.dart';
import '/backend/model/transfer/insert_receiving_info.dart';
import '/utils/basic_screen_imports.dart';
import '../../model/transfer/initial_transfer_model.dart';
import '../../model/transfer/manual_confirm_model.dart';
import '../../model/transfer/manual_dynamic_input.dart';
import '../../model/transfer/payment_gateway_model.dart';
import '../../model/transfer/submit_automatic_gateway.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';

class TransferApiServices {
  ///* gateway get process api
  static Future<PaymentGatewayModel?> paymentGatewayApiProcess() async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        ApiEndpoint.paymentGatewayURL,
        code: 200,
      );
      if (mapResponse != null) {
        PaymentGatewayModel result = PaymentGatewayModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from gateway get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* manual Input dynamic process api
  static Future<ManualDynamicInputModel?> manualDynamicApiProcess(trx) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
       "${ApiEndpoint.manualGatewayDynamicInputURL}$trx",
        code: 200,
      );
      if (mapResponse != null) {
        ManualDynamicInputModel result =
            ManualDynamicInputModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Manual Dynamic Input get process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*initial transfer process api
  static Future<InitialTransferModel?> initialApiProcess(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.initialTransferURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        InitialTransferModel result =
            InitialTransferModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from initial transfer process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*tatum automatic submit process api
  static Future<TatumDynamicModel?> tatumApiProcess(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.submitWithAutomaticGatewayURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        TatumDynamicModel result =
            TatumDynamicModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from Tatum Dynamic Model process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*insert receiving transfer process api
  static Future<InsertReceivingInfoModel?> insertTransferApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipartMultiFile(
          "${ApiEndpoint.insertReceivingURL}/${LocalStorages.getTrx()}", body,
          fieldList: fieldList, pathList: pathList, code: 200);

      if (mapResponse != null) {
        InsertReceivingInfoModel result =
            InsertReceivingInfoModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from insert transfer receiving process api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*automatic Submit  transfer process api
  static Future<SubmitAutomaticGatewayModel?> automaticSubmitApiProcess(
      {required Map<String, dynamic> body}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        ApiEndpoint.submitWithAutomaticGatewayURL,
        body,
        code: 200,
      );
      if (mapResponse != null) {
        SubmitAutomaticGatewayModel result =
            SubmitAutomaticGatewayModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          '🐞🐞🐞 err from automatic submit process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///*manual success process api
  static Future<ManualConfirmModel?> manualSuccessApi({
    required Map<String, String> body,
    required List<String> pathList,
    required List<String> fieldList,
  }) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).multipartMultiFile(
          ApiEndpoint.submitWithManualGatewayURL, body,
          fieldList: fieldList, pathList: pathList, code: 200);      
      if (mapResponse != null) {
        ManualConfirmModel result = ManualConfirmModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e('err from manual success api service ==> $e');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }

  ///* tatumSubmitProcessApi api services
 static Future<CommonSuccessModel?> tatumSubmitProcessApi(
      {required Map<String, dynamic> body, required url}) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).post(
        url,
        body,
      );
      if (mapResponse != null) {
        CommonSuccessModel result = CommonSuccessModel.fromJson(mapResponse);
        return result;
      }
    } catch (e) {
      log.e(
          ':ladybug::ladybug::ladybug: err from BuyCryptoTatumSubmit api service ==> $e :ladybug::ladybug::ladybug:');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
