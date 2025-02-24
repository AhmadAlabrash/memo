import '/backend/model/tracking/download_pdf.dart';
import '/backend/model/tracking/track_model.dart';
import '../../utils/api_method.dart';
import '../../utils/custom_snackbar.dart';
import '../api_endpoint.dart';


class TrackApiServices {
  ///* download process api
  static Future<ExportPdfModel?> pdfApiProcess(trx) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.downloadPdfURL}$trx",
        code: 200,
      );
      if (mapResponse != null) {
        ExportPdfModel result = ExportPdfModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from pdf download process api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
  ///* track process api
  static Future<TrackModel?> trackApiProcess(trx) async {
    Map<String, dynamic>? mapResponse;
    try {
      mapResponse = await ApiMethod(isBasic: false).get(
        "${ApiEndpoint.trackURL}$trx",
        code: 200,
      );
      if (mapResponse != null) {
        TrackModel result = TrackModel.fromJson(mapResponse);

        return result;
      }
    } catch (e) {
      log.e('🐞🐞🐞 err from Track model api service ==> $e 🐞🐞🐞');
      CustomSnackBar.error('Something went Wrong!');
      return null;
    }
    return null;
  }
}
