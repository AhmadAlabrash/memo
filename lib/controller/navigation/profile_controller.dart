import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../backend/model/common/common_success_model.dart';
import '../../backend/model/profile/profile_info_model.dart';
import '../../backend/services/api_endpoint.dart';
import '../../backend/services/profile/profile_api_services.dart';
import '../../backend/utils/api_method.dart';
import '../../utils/basic_screen_imports.dart';

class ProfileController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final sateController = TextEditingController();
  final zipCodeController = TextEditingController();
  final countryController = TextEditingController();
  RxBool isImagePathSet = false.obs;



  

  // >>> set value for country
  RxString selectCountry = ''.obs;
  RxString selectCountryCode = ''.obs;
  RxString userEmailAddress = ''.obs;
  RxString userFullName = ''.obs;
  RxString userInfoImage = ''.obs;
  RxString userImage = ''.obs;
  RxString defaultImage = ''.obs;
  RxString imagePath = ''.obs;

  List<Map<String, String>> jsonList = [];
  RxString userImagePath = ''.obs;
  File? image;
  ImagePicker picker = ImagePicker();
  chooseImageFromGallery() async {
    var pickImage = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickImage!.path);
    if (image!.path.isNotEmpty) {
      userImagePath.value = image!.path;
      isImagePathSet.value = true;
    }
  }

  chooseImageFromCamera() async {
    var pickImage = await picker.pickImage(source: ImageSource.camera);
    image = File(pickImage!.path);
    if (image!.path.isNotEmpty) {
      userImagePath.value = image!.path;
      isImagePathSet.value = true;
    }
  }

  get onUpdateProfile => isImagePathSet.value
      ? profileUpdateWithImageProcess()
      : profileUpdateWithOutImageProcess();
  @override
  void onInit() {
    getProfileInfoProcess();
    super.onInit();
  }

  /// >> set loading process & Profile Info Model
  final _isLoading = false.obs;
  late ProfileInfoModel _profileInfoModel;

  /// >> get loading process & Profile Info Model
  bool get isLoading => _isLoading.value;
  ProfileInfoModel get profileInfoModel => _profileInfoModel;

  ///* Get profile info api process
  Future<ProfileInfoModel> getProfileInfoProcess() async {
    _isLoading.value = true;
    update();

    await ProfileApiServices.getProfileInfoProcessApi().then((value) {
      _profileInfoModel = value!;
      _setData(_profileInfoModel);
      // List<Country> countries = profileInfoModel.data.countries;
      // jsonList = countries.map((Country country) {
      //   return {
      //     "name": country.name,
      //     "dial_code": country.mobileCode,
      //     "code": country.currencyCode,
      //   };
      // }).toList();
      _isLoading.value = false;
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isLoading.value = false;
    update();
    return _profileInfoModel;
  }

  void _setData(ProfileInfoModel profileModel) {
    var data = profileModel.data;
    userFullName.value = '${data.userInfo.firstname} ${data.userInfo.lastname}';
    firstNameController.text = data.userInfo.firstname;
    lastNameController.text = data.userInfo.lastname;
    phoneNumberController.text = data.userInfo.mobile;
    addressController.text = data.userInfo.address;
    cityController.text = data.userInfo.city;
    sateController.text = data.userInfo.state;
    zipCodeController.text = data.userInfo.zipCode;
    userEmailAddress.value = data.userInfo.email;
    selectCountryCode.value = data.userInfo.mobileCode;
     selectCountry.value = data.userInfo.country.isEmpty ?"Select Country": data.userInfo.country;


    debugPrint(data.userInfo.country);
    
    LocalStorages.saveEmail(email: data.userInfo.email);
    LocalStorages.saveName(name: userFullName.value);
    LocalStorages.saveNumber(num: data.userInfo.mobile);

    if (data.userInfo.image != '') {
      userImage.value =
          '${data.imagePaths.baseUrl}/${data.imagePaths.pathLocation}/${data.userInfo.image}';
    } else {
      userImage.value =
          '${ApiEndpoint.mainDomain}/${data.imagePaths.defaultImage}';
    }

    // debugPrint(data.userInfo.email.toString());
    // if (data.userInfo.email == 1 && data.user.kycVerified == 1) {
    //   LocalStorage.saveUserVerified(value: true);
    // } else {
    //   LocalStorage.saveUserVerified(value: false);
    // }

    update();
  }

  /// >> set loading process & profile update model
  final _isUpdateLoading = false.obs;
  late CommonSuccessModel _profileUpdateModel;

  /// >> get loading process & profile update model
  bool get isUpdateLoading => _isUpdateLoading.value;
  CommonSuccessModel get profileUpdateModel => _profileUpdateModel;

  Future<CommonSuccessModel> profileUpdateWithOutImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, dynamic> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'mobile_code': selectCountryCode.value,
      'mobile': phoneNumberController.text,
      'country': selectCountry.value,
      'city': cityController.text,
      'state': sateController.text,
      'zip_code': zipCodeController.text,
      'address': addressController.text,
    };

    await ProfileApiServices.updateProfileWithoutImageApi(body: inputBody)
        .then((value) {
      _profileUpdateModel = value!;
      getProfileInfoProcess();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _profileUpdateModel;
  }

  // Profile update process with image
  Future<CommonSuccessModel> profileUpdateWithImageProcess() async {
    _isUpdateLoading.value = true;
    update();

    Map<String, String> inputBody = {
      'firstname': firstNameController.text,
      'lastname': lastNameController.text,
      'mobile_code': selectCountryCode.value,
      'mobile': phoneNumberController.text,
      'country': selectCountry.value,
      'city': cityController.text,
      'state': sateController.text,
      'zip_code': zipCodeController.text,
      'address': addressController.text,
    };

    await ProfileApiServices.updateProfileWithImageApi(
      body: inputBody,
      filepath: userImagePath.value,
    ).then((value) {
      _profileUpdateModel = value!;
      getProfileInfoProcess();
      update();
    }).catchError((onError) {
      log.e(onError);
    });

    _isUpdateLoading.value = false;
    update();
    return _profileUpdateModel;
  }
}
