import '/controller/send_money/payment_gateway_controller.dart';
import '../../backend/model/transfer/manual_confirm_model.dart';
import '../../backend/model/transfer/manual_dynamic_input.dart';
import '../../backend/services/transfer/transfer_api_service.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';
import '../../widgets/inputs/primary_text_input_area_widget.dart';
import '../../widgets/others/evidance_note_image_picker.dart';

class PaymentManualController extends GetxController {
  get onContinues => manualConfirmProcess();
  List<TextEditingController> inputFieldControllers = [];
  RxList inputFields = [].obs;
  List<String> listImagePath = [];
  List<String> listFieldName = [];
  RxBool hasFile = false.obs;
  final controller = Get.put(PaymentGatewayController());

  /// >>> set variable for dynamic input fields
  String? getImagePath(String fieldName) {
    if (listFieldName.contains(fieldName)) {
      int itemIndex = listFieldName.indexOf(fieldName);
      return listImagePath[itemIndex];
    }
    return null;
  }

  updateImageData(String fieldName, String imagePath) {
    if (listFieldName.contains(fieldName)) {
      int itemIndex = listFieldName.indexOf(fieldName);
      listImagePath[itemIndex] = imagePath;
    } else {
      listFieldName.add(fieldName);
      listImagePath.add(imagePath);
    }
    update();
  }

  @override
  void onInit() {
    getManualDynamicProcess();
    super.onInit();
  }

  /// >> set loading process & manual get Info Model
  final _isLoading = false.obs;
  late ManualDynamicInputModel _manualDynamicInputModel;

  /// >> get loading process & manual get Info Model
  bool get isLoading => _isLoading.value;
  ManualDynamicInputModel get manualDynamicInputModel =>
      _manualDynamicInputModel;

  ///* get manual info process
  Future<ManualDynamicInputModel> getManualDynamicProcess() async {
    _isLoading.value = true;
    update();

    await TransferApiServices.manualDynamicApiProcess(controller.trx.value)
        .then((value) {
      _manualDynamicInputModel = value!;

      ///*manual get api process start
      final data = _manualDynamicInputModel.data.inputFields;

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
              child: ProofImagePickerWidget(
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

      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _manualDynamicInputModel;
  }

// ******  >>>>>>>>>  manual confirm started
  final _isConfirmLoading = false.obs;
  late ManualConfirmModel _manualConfirmModel;

  /// >> set loading process &  manual transfer Model
  bool get isConfirmLoading => _isConfirmLoading.value;

  ManualConfirmModel get manualConfirmModel => _manualConfirmModel;

  Future<ManualConfirmModel> manualConfirmProcess() async {
    _isConfirmLoading.value = true;
    Map<String, String> inputBody = {
      "identifier": _manualDynamicInputModel.data.identifier,
    };

    final data = _manualDynamicInputModel.data.inputFields;

    for (int i = 0; i < data.length; i += 1) {
      if (data[i].type != 'file') {
        inputBody[data[i].name] = inputFieldControllers[i].text;
      }
    }
    await TransferApiServices.manualSuccessApi(
            body: inputBody, fieldList: listFieldName, pathList: listImagePath)
        .then((value) {
      _manualConfirmModel = value!;
      controller.pdfTrxString.value = manualConfirmModel.data.transactionTrx;
      LocalStorages.saveTrackingTrx(trx: controller.pdfTrxString.value);
      Get.toNamed(Routes.goToCongratulationScreen);
      _isConfirmLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isConfirmLoading.value = false;
    update();

    return _manualConfirmModel;
  }
}
