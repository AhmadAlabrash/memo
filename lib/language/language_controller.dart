// import 'package:get_storage/get_storage.dart';

// import '../utils/basic_screen_imports.dart';
// import 'language_model.dart';
// import 'language_service.dart';

// class LanguageController extends GetxController {
//   RxString selectedLanguage = "".obs; // Selected language is English
//   RxString defLangKey = "".obs; // Default language is English
// RxString languageDirectionText = "ltr".obs;
// RxString rxNewValue = "".obs;
//   @override
//   void onInit() {
//     fetchLanguages().then((value) => getDefaultKey());
//     super.onInit();
//   }

//   late List<Language> languages;

//   final _isLoading = false.obs;

//   bool get isLoading => _isLoading.value;
//   static const String selectedLanguageKey = 'selectedLanguage';

//   Future<void> fetchLanguages() async {
//     _isLoading.value = true;
//     try {
//       final languageService = LanguageService();
//       languages = await languageService.fetchLanguages();
//       _isLoading.value = false;
//     } catch (e) {
//       debugPrint('Error fetching language data: $e');
//     }
//   }

//   // >> get default language key
//   String getDefaultKey() {
//     _isLoading.value = true;
//     final selectedLang = languages.firstWhere(
//       (lang) => lang.status == true,
//       orElse: () => languages.firstWhere(
//         (lang) => lang.status == false,
//       ), // Fallback to language default code, when status true.
//     );
//     defLangKey.value = selectedLang.code;
//     debugPrint('Default key ${defLangKey.value} ${selectedLang.code}');

//     // Load selected language from cache
//     final box = GetStorage();
//     selectedLanguage.value = box.read(selectedLanguageKey) ?? defLangKey.value;
//     rxNewValue.value = box.read(selectedLanguageKey) ?? defLangKey.value;
//     debugPrint(box.read('SELECTED KEY $selectedLanguageKey'));
//     _isLoading.value = false;
//     return selectedLang.code;
//   }

//   void changeLanguage(String newLanguage) {
//     selectedLanguage.value = newLanguage;
//     rxNewValue.value = newLanguage;
//     final box = GetStorage();
//     box.write(selectedLanguageKey, newLanguage);
//     update();
//   }

//   String getTranslation(String key) {
//     final selectedLang = languages.firstWhere(
//       (lang) => lang.code == selectedLanguage.value,
//       orElse: () => languages.firstWhere(
//         (lang) => lang.code == defLangKey.value,
//       ),
//     );

//     final defaultLanguage = languages.firstWhere(
//       (lang) => lang.code == 'en',
//       orElse: () => languages.firstWhere(
//         (lang) => lang.code == 'en',
//       ),
//     );

//     String value;
//     if (selectedLang.translateKeyValues[key] == '' ||
//         selectedLang.translateKeyValues[key] == null) {
//       value = defaultLanguage.translateKeyValues[key] ?? key;
//     } else {
//       value = selectedLang.translateKeyValues[key] ?? key;
//     }

//     return value;
//   }

//   /// Get text direction [ when selected language null return default direction ]
//   TextDirection get languageDirection {
//     _isLoading.value = true;
//     try {
//       final selectedLang = languages.firstWhere(
//         (lang) => lang.code == selectedLanguage.value,
//         orElse: () => languages.firstWhere(
//           (lang) => lang.code == defLangKey.value,
//         ),
//       );
//       _isLoading.value = false;

//            languageDirectionText.value = selectedLang.dir == 'rtl' ? "rtl" : "ltr";
//       return selectedLang.dir == 'rtl' ? TextDirection.rtl : TextDirection.ltr;
//     } catch (e) {
//       return TextDirection.ltr; // Fallback to left-to-right (LTR)
//     }
//   }
// }

import 'package:get_storage/get_storage.dart';
import '../utils/basic_screen_imports.dart';
import 'language_model.dart';
import 'language_service.dart';

final languageSettingsController =
    Get.put(LanguageController(), permanent: true);

class LanguageController extends GetxController {
  RxString selectedLanguage = "".obs; // Selected language is English
  RxString defLangKey = "".obs; // Default language is English
  RxString languageDirectionText = "ltr".obs;
  RxString rxNewValue = "".obs;

  @override
  void onInit() {
    fetchLanguages().then((value) => getDefaultKey());
    super.onInit();
  }

  List<Language> languages = [];
  var isLoadingValue = false.obs;

  bool get isLoading => isLoadingValue.value;
  static const String selectedLanguageKey = 'selectedLanguage';

  Future<void> fetchLanguages() async {
    isLoadingValue.value = true;

    try {
      final languageService = LanguageService();
      languages = await languageService.fetchLanguages();
      isLoadingValue.value = false;
    } catch (e) {
      isLoadingValue.value = false;
      debugPrint('Error fetching language data: $e');
    }
  }

  // >> get default language key
  String getDefaultKey() {
    isLoadingValue.value = true;
    final selectedLang = languages.firstWhere(
      (lang) => lang.status == true,
      orElse: () => languages.firstWhere(
        (lang) => lang.status == false,
      ), // Fallback to language default code, when status true.
    );

    defLangKey.value = selectedLang.code;

    // Load selected language from cache
    final box = GetStorage();
    selectedLanguage.value = box.read(selectedLanguageKey) ?? defLangKey.value;
    rxNewValue.value = box.read(selectedLanguageKey) ?? defLangKey.value;
    isLoadingValue.value = false;
    return selectedLang.code;
  }

  void changeLanguage(String newLanguage) {
    selectedLanguage.value = newLanguage;
    rxNewValue.value = newLanguage;
    final box = GetStorage();
    box.write(selectedLanguageKey, newLanguage);
    update();
  }

  String getTranslation(String key) {
    final selectedLang = languages.firstWhere(
      (lang) => lang.code == selectedLanguage.value,
      orElse: () => languages.firstWhere(
        (lang) => lang.code == defLangKey.value,
      ),
    );

    final defaultLanguage = languages.firstWhere(
      (lang) => lang.code == 'en',
      orElse: () => languages.firstWhere(
        (lang) => lang.code == 'en',
      ),
    );

    String value;
    if (selectedLang.translateKeyValues[key] == '' ||
        selectedLang.translateKeyValues[key] == null) {
      value = defaultLanguage.translateKeyValues[key] ?? key;
    } else {
      value = selectedLang.translateKeyValues[key] ?? key;
    }

    return value;
  }

  /// Get text direction [ when selected language null return default direction ]
  TextDirection get languageDirection {
    isLoadingValue.value = true;
    try {
      final selectedLang = languages.firstWhere(
        (lang) => lang.code == selectedLanguage.value,
        orElse: () => languages.firstWhere(
          (lang) => lang.code == defLangKey.value,
        ),
      );
      isLoadingValue.value = false;
      languageDirectionText.value = selectedLang.dir == 'rtl' ? "rtl" : "ltr";
      update();
      return selectedLang.dir == 'rtl' ? TextDirection.rtl : TextDirection.ltr;
    } catch (e) {
      return TextDirection.ltr; // Fallback to left-to-right (LTR)
    }
  }
}
