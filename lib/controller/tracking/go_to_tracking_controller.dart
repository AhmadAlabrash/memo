// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../send_money/payment_gateway_controller.dart';
import '/backend/model/tracking/download_pdf.dart';
import '/backend/services/track/track_api_service.dart';
import '../../backend/utils/api_method.dart';
import '../../backend/utils/custom_snackbar.dart';
import '../../utils/basic_screen_imports.dart';

class GoToTrackingController extends GetxController {
  final controller = Get.put(PaymentGatewayController());
  @override
  void onInit() {
    controller.pdfTrxString.value;

    downPdfApiProcess();

    super.onInit();
  }

  /// >> set loading process & pdf Info Model
  final _isLoading = false.obs;
  late ExportPdfModel _exportPdfModel;

  /// >> get loading process & pdf Info Model
  bool get isLoading => _isLoading.value;
  ExportPdfModel get exportPdfModel => _exportPdfModel;

  ///* Get pdf info api process
  Future<ExportPdfModel> downPdfApiProcess() async {
    _isLoading.value = true;
    update();
    await TrackApiServices.pdfApiProcess(controller.pdfTrxString.value)
        .then((value) {
      _exportPdfModel = value!;
    
      update();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _exportPdfModel;
  }

  final _isDownloadLoading = false.obs;
  bool get isDownloadLoading => _isDownloadLoading.value;
  Future<void> downloadPDF(
      {required String url, required String pdfFileName}) async {
    _isDownloadLoading.value = true;
    // Check and request storage permission
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        // Permission denied by user
        CustomSnackBar.error('Permission denied. Unable to download the file.');
        return;
      }
    }
    final http.Response response = await http.get(Uri.parse(url));
    final String fileName = '${DateTime.now().millisecondsSinceEpoch}.pdf';
    // kept the file name in the global variable pdfFilename
    pdfFileName = fileName;
    if (response.statusCode == 200) {
      Directory? downloadsDirectory;
      if (Platform.isIOS) {
        _isDownloadLoading.value = false;
        downloadsDirectory = await getDownloadsDirectory();
      } else if (Platform.isAndroid) {
        _isDownloadLoading.value = false;
        String directory = "/storage/emulated/0/";
        final bool dirDownloadExists =
            await Directory("$directory/Download").exists();
        directory += dirDownloadExists ? "Download/" : "Downloads/";
        downloadsDirectory = Directory(directory);
      } else {
        // Handle other platforms here, if applicable
        CustomSnackBar.error('Unsupported platform for file download.');
        _isDownloadLoading.value = false;

        return;
      }

      final File file = File('${downloadsDirectory!.path}/$pdfFileName');
      await file.writeAsBytes(response.bodyBytes);
      CustomSnackBar.success('File downloaded successfully at ${file.path}!');
      _isDownloadLoading.value = false;
    } else {
      _isDownloadLoading.value = false;
      CustomSnackBar.error('Failed to download the file.');
    }
  }

  get onTraceTap => Routes.trackingScreen.toNamed;
}
