import '/backend/services/api_endpoint.dart';
import '../../backend/model/common/common_success_model.dart';
import '/backend/model/transfer/initial_transfer_model.dart';
import '/backend/model/transfer/insert_receiving_info.dart';
import '/backend/services/transfer/transfer_api_service.dart';
import '../../backend/model/transfer/payment_gateway_model.dart';
import '../../backend/model/transfer/submit_automatic_gateway.dart';
import '../../backend/model/transfer/tatum_model.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/inputs/primary_text_input_area_widget.dart';
import '../../widgets/others/manual_payment_image_widget.dart';

class PaymentGatewayController extends GetxController {
  final senderAmountController = TextEditingController();
  final receiverAmountController = TextEditingController();
  get onContinues => initialTransferProcess();
  get onInsertContinue => insertTransferProcess();

  // get onConfirm => insertTransferProcess();
  List<TextEditingController> inputFieldControllers = [];
  RxList inputFields = [].obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];
  RxBool hasFile = false.obs;
  //>>>>>
  List<TextEditingController> inputFieldControllersTatum = [];
  RxList inputFieldsTatum = [].obs;
  List<String> listImagePathTatum = [];
  List<String> listFieldNameTatum = [];
  RxBool hasFileTatum = false.obs;
  String trackingTrx = "";
  
  RxString pdfTrxString = "".obs;
  String senderGateway = "";
  String senderCurrencyCode = "";
  String senderAmount = "";
  String receiverGateway = "";
  String receiverCurrencyCode = "";
  String receiverAmount = "";
  final amountTextController = TextEditingController();
  List<String> totalAmount = [];
  List<Currency> senderCurrencyList = [];
  List<CurrencyReceiver> receiverCurrencyList = [];

  RxString senderAlias = ''.obs;
  RxString senderCurrency = ''.obs;
  RxString senderWallet = ''.obs;
  RxString senderImage = ''.obs;
  RxString senderHintImage = ''.obs;

  RxString receiverAlias = ''.obs;
  RxString receiverCurrency = ''.obs;
  RxString receiverWallet = ''.obs;
  RxString receiverImage = ''.obs;
  RxString receiverHintImage = ''.obs;
  RxString gatewayType = ''.obs;
  RxString receiverGatewayType = ''.obs;

  RxDouble minLimit = 0.0.obs;
  RxDouble maxLimit = 0.0.obs;
  RxDouble senderRate = 0.0.obs;
  RxDouble receiverRate = 0.0.obs;
  RxDouble senderExchange = 0.0.obs;
  RxDouble receiverExchange = 0.0.obs;
  RxDouble exchangeRate = 0.0.obs;

  RxString trx = ''.obs;

  @override
  void dispose() {
    amountTextController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    getPaymentInfoProcess();
    super.onInit();
  }

  String getType(int paymentGatewayId) {
    for (var element in paymentGatewayModel.data.senderGateways) {
      if (element.id == paymentGatewayId) {
        gatewayType.value = element.type.name;
      }
    }

    return gatewayType.value == 'MANUAL' ? gatewayType.value : '';
  }

  ///>> receiver
  // String getReceiverType(int paymentGatewayId) {
  //   for (var element in paymentGatewayModel.data.receiverGateways) {
  //     if (element.id == paymentGatewayId) {
  //       receiverGatewayType.value = element.type.name;
  //     }
  //   }

  //   return receiverGatewayType.value == 'MANUAL'
  //       ? receiverGatewayType.value
  //       : '';
  // }

  /// >> set loading process & payment Gateway Info Model
  final _isLoading = false.obs;
  late PaymentGatewayModel _paymentGatewayModel;

  /// >> get loading process & payment Gateway Info Model
  bool get isLoading => _isLoading.value;
  PaymentGatewayModel get paymentGatewayModel => _paymentGatewayModel;

  ///* get add add money info process
  Future<PaymentGatewayModel> getPaymentInfoProcess() async {
    receiverCurrencyList.clear();
    _isLoading.value = true;
    update();

    await TransferApiServices.paymentGatewayApiProcess().then((value) {
      _paymentGatewayModel = value!;
      _setPreviewData(_paymentGatewayModel);

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _paymentGatewayModel;
  }

  _setPreviewData(PaymentGatewayModel paymentGatewayModel) {
    var data =
        paymentGatewayModel.data.senderGateways.first.currencies.first.image;
    var path = paymentGatewayModel.data.imagePaths.pathLocation;
    senderWallet.value =
        paymentGatewayModel.data.senderGateways.first.currencies.first.name;
    senderAlias.value =
        paymentGatewayModel.data.senderGateways.first.currencies.first.alias;
    senderRate.value = double.parse(
        paymentGatewayModel.data.senderGateways.first.currencies.first.rate);
    senderCurrency.value = paymentGatewayModel
        .data.senderGateways.first.currencies.first.currencyCode;
    senderExchange.value = double.parse(
            paymentGatewayModel.data.senderGateways.first.currencies.first.rate)
        .toDouble();
    senderHintImage.value = "${ApiEndpoint.mainDomain}/$path/$data";
    //for sender gateway
    for (var gateways in paymentGatewayModel.data.senderGateways) {
      for (var currency in gateways.currencies) {
        senderCurrencyList.add(
          Currency(
            createdAt: currency.createdAt,
            updatedAt: currency.updatedAt,
            id: currency.id,
            paymentGatewayId: currency.paymentGatewayId,
            name: currency.name,
            alias: currency.alias,
            currencyCode: currency.currencyCode,
            currencySymbol: currency.currencySymbol,
            minLimit: currency.minLimit,
            maxLimit: currency.maxLimit,
            percentCharge: currency.percentCharge,
            fixedCharge: currency.fixedCharge,
            rate: currency.rate,
            image: currency.image,
          ),
        );
      }
    }
    //>>>>>>. receiver get
    var datas =
        paymentGatewayModel.data.senderGateways.first.currencies.first.image;
    var paths = paymentGatewayModel.data.imagePaths.pathLocation;
    receiverAlias.value =
        paymentGatewayModel.data.receiverGateways.first.currencies.first.alias;
    receiverWallet.value =
        paymentGatewayModel.data.receiverGateways.first.currencies.first.name;
    receiverCurrency.value = paymentGatewayModel
        .data.receiverGateways.first.currencies.first.currencyCode;

    receiverHintImage.value = "${ApiEndpoint.mainDomain}/$paths/$datas";
    receiverRate.value = double.parse(paymentGatewayModel
            .data.receiverGateways.first.currencies.first.rate)
        .toDouble();
    receiverExchange.value = double.parse(paymentGatewayModel
            .data.receiverGateways.first.currencies.first.rate)
        .toDouble();

    for (var gateways in paymentGatewayModel.data.receiverGateways) {
      for (var currency in gateways.currencies) {
        receiverCurrencyList.add(
          CurrencyReceiver(
            createdAt: currency.createdAt,
            updatedAt: currency.updatedAt,
            id: currency.id,
            paymentGatewayId: currency.paymentGatewayId,
            name: currency.name,
            alias: currency.alias,
            currencyCode: currency.currencyCode,
            currencySymbol: currency.currencySymbol,
            minLimit: currency.minLimit,
            maxLimit: currency.maxLimit,
            percentCharge: currency.percentCharge,
            fixedCharge: currency.fixedCharge,
            rate: currency.rate,
            image: currency.image,
          ),
        );
      }
    }
  }

// ******  >>>>>>>>> initial transfer started
  /// >> set loading process & initial transfer Model
  final _isTransferLoading = false.obs;
  late InitialTransferModel _initialTransferModel;

  /// >> set loading process &  initial transfer Model
  bool get isTransferLoading => _isTransferLoading.value;
  InitialTransferModel get initialTransferModel => _initialTransferModel;

  ///* initial transfer process
  Future<InitialTransferModel> initialTransferProcess() async {
    _isTransferLoading.value = true;
    inputFields.clear();
    listImagePath.clear();
    listFieldName.clear();
    inputFieldControllers.clear();
    update();
    Map<String, dynamic> inputBody = {
      'sender_amount': senderAmountController.text,
      'sender_currency': senderAlias.value,
      'receiver_amount': receiverAmountController.text,
      'receiver_currency': receiverAlias.value,
    };

    await TransferApiServices.initialApiProcess(body: inputBody).then((value) {
      _initialTransferModel = value!;
      senderGateway = _initialTransferModel.data.sendingMethod;
      senderCurrencyCode = _initialTransferModel.data.senderCurrency;
      senderAmount = _initialTransferModel.data.senderAmount;
      receiverGateway = _initialTransferModel.data.receivingMethod;
      receiverCurrencyCode = _initialTransferModel.data.receiverCurrency;
      receiverAmount = _initialTransferModel.data.receiverAmount;
    pdfTrxString.value = _initialTransferModel.data.identifier;
    LocalStorages.saveTrxKey(trx: _initialTransferModel.data.identifier);

      trx.value = _initialTransferModel.data.identifier;

      ///* initial api process start
      final data = _initialTransferModel.data.receiverInputFields;

      for (int item = 0; item < data.length; item++) {
        // make the dynamic controller
        var textEditingController = TextEditingController();
        inputFieldControllers.add(textEditingController);

        // make dynamic input widget
        if (data[item].type.contains('file')) {
          hasFile.value = true;
          inputFields.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ManualPaymentImageWidget(
                labelName: data[item].label,
                fieldName: data[item].name,
              ),
            ),
          );
        } else if (data[item].type.contains('text') ||
            data[item].type.contains('textarea')) {
          inputFields.add(
            Column(
              children: [
                PrimaryInputWidget(
                  controller: inputFieldControllers[item],
                  label: data[item].label,
                  hintText: data[item].label,
                  isValidator: data[item].required,
                ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75),
              ],
            ),
          );
        }
      }

      Get.toNamed(Routes.receivingMethodScreen);
      _isTransferLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isTransferLoading.value = false;
    update();
    return _initialTransferModel;
  }

// ******  >>>>>>>>> insert receiving transfer started
  final _isInsertLoading = false.obs;
  late InsertReceivingInfoModel _insertReceivingInfoModel;

  /// >> set loading process &  initial transfer Model
  bool get isInsertLoading => _isInsertLoading.value;

  InsertReceivingInfoModel get insertReceivingInfoModel =>
      _insertReceivingInfoModel;

  Future<InsertReceivingInfoModel> insertTransferProcess() async {
    _isInsertLoading.value = true;
    Map<String, String> inputBody = {};

    final data = _initialTransferModel.data.receiverInputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    await TransferApiServices.insertTransferApi(
    
            body: inputBody, fieldList: listFieldName, pathList: listImagePath)
        .then((value) {
      _insertReceivingInfoModel = value!;

      Get.toNamed(Routes.paymentPreviewScreen);
      _isInsertLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isInsertLoading.value = false;
    update();
    return _insertReceivingInfoModel;
  }

  //>>>>>>>>>>> started automatic

  /// >> set loading process & automatic payment Info Model
  final _isAutomaticLoading = false.obs;

  /// >> get loading process & automatic payment Info Model
  bool get isAutomaticLoading => _isAutomaticLoading.value;

  late SubmitAutomaticGatewayModel _submitAutomaticGatewayModel;
  SubmitAutomaticGatewayModel get submitAutomaticGatewayModel =>
      _submitAutomaticGatewayModel;

  ///* automatic stripe api process start
  Future<SubmitAutomaticGatewayModel> paymentStripeProcess() async {
    _isAutomaticLoading.value = true;
    update();
    Map<String, dynamic> inputBody = {
      'identifier': pdfTrxString.value,
    };

    await TransferApiServices.automaticSubmitApiProcess(body: inputBody)
        .then((value) {
      _submitAutomaticGatewayModel = value!;

      Routes.webViewScreen.toNamed;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isAutomaticLoading.value = false;
    update();
    return _submitAutomaticGatewayModel;
  }

  /// >> set loading process & automatic tatum payment Info Model
  final _isTatumLoading = false.obs;
  bool get isTatumLoading => _isTatumLoading.value;

  late TatumDynamicModel _tatumDynamicModel;
  TatumDynamicModel get tatumDynamicModel => _tatumDynamicModel;

  ///* tatum api process start
  Future<TatumDynamicModel> tatumProcess() async {
    _isAutomaticLoading.value = true;
    inputFieldsTatum.clear();
    listImagePathTatum.clear();
    listFieldNameTatum.clear();
    inputFieldControllersTatum.clear();
    update();
    Map<String, dynamic> inputBody = {
      'identifier': pdfTrxString.value,
    };
    await TransferApiServices.tatumApiProcess(body: inputBody).then((value) {
      _tatumDynamicModel = value!;

      ///* initial api process start
      final data = _tatumDynamicModel.data.addressInfo.inputFields;

      for (int item = 0; item < data.length; item++) {
        // make the dynamic controller
        var textEditingController = TextEditingController();
        inputFieldControllersTatum.add(textEditingController);

        // make dynamic input widget
        if (data[item].type.contains('file')) {
          hasFileTatum.value = true;
          inputFieldsTatum.add(
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ManualPaymentImageWidget(
                labelName: data[item].label,
                fieldName: data[item].name,
              ),
            ),
          );
        } else if (data[item].type.contains('text') ||
            data[item].type.contains('textarea')) {
          inputFieldsTatum.add(
            Column(
              children: [
                PrimaryInputWidget(
                  controller: inputFieldControllersTatum[item],
                  label: data[item].label,
                  hintText: data[item].label,
                  isValidator: data[item].required,
                ).paddingOnly(bottom: Dimensions.marginSizeVertical * 0.75),
              ],
            ),
          );
        }
      }

      Get.toNamed(Routes.tatumManualScreen);
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isInsertLoading.value = false;
    update();
    return _tatumDynamicModel;
  }

//>>>>>. tatum confirm start
  final _isTatumConfirmLoading = false.obs;
  bool get isTatumConfirmLoading => _isTatumConfirmLoading.value;
  late CommonSuccessModel _buyCryptoTatumSubmitModel;
  CommonSuccessModel get buyCryptoTatumSubmitModel =>
      _buyCryptoTatumSubmitModel;

  ///* tatum in process
  Future<CommonSuccessModel> tatumSubmitProcess(
      {required List<InputField> data, required String url}) async {
    _isTatumConfirmLoading.value = true;
    update();
    Map<String, String> inputBody = {};

    // final data = _buyCryptoTatumModel.data.addressInfo.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }

    await TransferApiServices.tatumSubmitProcessApi(body: inputBody, url: url)
        .then((value) {
      _buyCryptoTatumSubmitModel = value!;
      inputFieldsTatum.clear();
      listImagePathTatum.clear();
      listFieldNameTatum.clear();
      inputFieldControllersTatum.clear();

      Get.toNamed(Routes.goToCongratulationScreen);

      _isTatumConfirmLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isTatumConfirmLoading.value = false;
    update();
    return _buyCryptoTatumSubmitModel;
  }

  void tatumSubmit() {
    tatumSubmitProcess(
        url: _tatumDynamicModel.data.addressInfo.submitUrl,
        data: _tatumDynamicModel.data.addressInfo.inputFields);
  }

  // exchange method
  get inputOnChangeReceiver => _recipientGetOnChange();

  get inputOnChangeSender => _senderSendAmount();

  _senderSendAmount() {
    double amount = _doubleParse(receiverAmountController.text);
    double rate = senderRate.value / receiverRate.value;
    double mainAmount = (amount * rate);

    if (mainAmount != 0.00) {
      senderAmountController.text = mainAmount.toStringAsFixed(2);
    } else {
      senderAmountController.clear();
    }
  }

  _recipientGetOnChange() {
    double amount = _doubleParse(senderAmountController.text);
    double rate = receiverRate.value / senderRate.value;
    double mainAmount = (amount * rate);

    if (mainAmount != 0.00) {
      receiverAmountController.text = mainAmount.toStringAsFixed(2);
    } else {
      receiverAmountController.clear();
    }
  }

  _doubleParse(amount) {
    return double.parse(amount.isNotEmpty ? amount : '0.0');
  }

 
}
