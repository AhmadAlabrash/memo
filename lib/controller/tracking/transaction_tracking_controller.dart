import '/backend/model/tracking/track_model.dart';
import '../../backend/services/track/track_api_service.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';

class TrackingController extends GetxController {
  @override
  void onInit() {
    trackGetApiProcess();
    super.onInit();
  }

  /// >> set loading process & track Info Model
  final _isLoading = false.obs;
  late TrackModel _trackModel;

  /// >> get loading process & track Info Model
  bool get isLoading => _isLoading.value;
  TrackModel get trackModel => _trackModel;

  ///* Get pdf info api process
  Future<TrackModel> trackGetApiProcess() async {
    _isLoading.value = true;
    update();
    await TrackApiServices.trackApiProcess(LocalStorages.getTrackingTrx()).then((value) {
      _trackModel = value!;
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });
    _isLoading.value = false;
    update();
    return _trackModel;
  }
}
