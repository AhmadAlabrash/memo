import 'dart:ui';

import 'package:get/get.dart';

import '../backend/services/api_endpoint.dart';
import '../language/language_controller.dart';

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  get toDouble => double.parse(this);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

extension SupperRoute on String {
  get toNamed => Get.toNamed(this);
  get offAllNamed => Get.offAllNamed(this);
  get offNamed => Get.offNamed(this);
}

extension EndPointExtensions on String {
  String addBaseURl() {
    return ApiEndpoint.baseUrl + this;
  }
}
extension SuperLanguage on String {
  get translation => Get.find<LanguageController>().getTranslation(this);
}

