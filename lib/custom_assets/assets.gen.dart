/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsClipartGen {
  const $AssetsClipartGen();

  /// File path: assets/clipart/Onboard.png
  AssetGenImage get onboard =>
      const AssetGenImage('assets/clipart/Onboard.png');

  /// File path: assets/clipart/Splash Screen.png
  AssetGenImage get splashScreen =>
      const AssetGenImage('assets/clipart/Splash Screen.png');

  /// File path: assets/clipart/drawer_frame.png
  AssetGenImage get drawerFrame =>
      const AssetGenImage('assets/clipart/drawer_frame.png');

  /// File path: assets/clipart/easy.png
  AssetGenImage get easy => const AssetGenImage('assets/clipart/easy.png');

  /// File path: assets/clipart/jazz.png
  AssetGenImage get jazz => const AssetGenImage('assets/clipart/jazz.png');

  /// File path: assets/clipart/profile.png
  AssetGenImage get profile =>
      const AssetGenImage('assets/clipart/profile.png');

  /// File path: assets/clipart/splash_tab.png
  AssetGenImage get splashTab =>
      const AssetGenImage('assets/clipart/splash_tab.png');

  /// File path: assets/clipart/successfull.svg
  String get successfull => 'assets/clipart/successfull.svg';

  /// File path: assets/clipart/tab_onboard.png
  AssetGenImage get tabOnboard =>
      const AssetGenImage('assets/clipart/tab_onboard.png');

  /// List of all assets
  List<dynamic> get values => [
        onboard,
        splashScreen,
        drawerFrame,
        easy,
        jazz,
        profile,
        splashTab,
        successfull,
        tabOnboard
      ];
}

class $AssetsIconGen {
  const $AssetsIconGen();

  /// File path: assets/icon/Vector.svg
  String get vector => 'assets/icon/Vector.svg';

  /// File path: assets/icon/account_circle.svg
  String get accountCircle => 'assets/icon/account_circle.svg';

  /// File path: assets/icon/bi_camera-fill.svg
  String get biCameraFill => 'assets/icon/bi_camera-fill.svg';

  /// File path: assets/icon/book_4.svg
  String get book4 => 'assets/icon/book_4.svg';

  /// File path: assets/icon/circle1.svg
  String get circle1 => 'assets/icon/circle1.svg';

  /// File path: assets/icon/circle2.svg
  String get circle2 => 'assets/icon/circle2.svg';

  /// File path: assets/icon/contact_page.svg
  String get contactPage => 'assets/icon/contact_page.svg';

  /// File path: assets/icon/encrypted.svg
  String get encrypted => 'assets/icon/encrypted.svg';

  /// File path: assets/icon/fa6-solid_power-off.svg
  String get fa6SolidPowerOff => 'assets/icon/fa6-solid_power-off.svg';

  /// File path: assets/icon/g_translate.svg
  String get gTranslate => 'assets/icon/g_translate.svg';

  /// File path: assets/icon/help.svg
  String get help => 'assets/icon/help.svg';

  /// File path: assets/icon/history.svg
  String get history => 'assets/icon/history.svg';

  /// File path: assets/icon/history_tab.svg
  String get historyTab => 'assets/icon/history_tab.svg';

  /// File path: assets/icon/info.svg
  String get info => 'assets/icon/info.svg';

  /// File path: assets/icon/key.svg
  String get key => 'assets/icon/key.svg';

  /// File path: assets/icon/mdi_arrow-bottom-left.svg
  String get mdiArrowBottomLeft => 'assets/icon/mdi_arrow-bottom-left.svg';

  /// File path: assets/icon/notifications.svg
  String get notifications => 'assets/icon/notifications.svg';

  /// File path: assets/icon/other_houses.svg
  String get otherHouses => 'assets/icon/other_houses.svg';

  /// File path: assets/icon/profile_tab.svg
  String get profileTab => 'assets/icon/profile_tab.svg';

  /// File path: assets/icon/send.svg
  String get send => 'assets/icon/send.svg';

  /// File path: assets/icon/settings.svg
  String get settings => 'assets/icon/settings.svg';

  /// File path: assets/icon/two_fa.svg
  String get twoFa => 'assets/icon/two_fa.svg';

  /// File path: assets/icon/visibility_off.svg
  String get visibilityOff => 'assets/icon/visibility_off.svg';

  /// File path: assets/icon/widgets.svg
  String get widgets => 'assets/icon/widgets.svg';

  /// List of all assets
  List<String> get values => [
        vector,
        accountCircle,
        biCameraFill,
        book4,
        circle1,
        circle2,
        contactPage,
        encrypted,
        fa6SolidPowerOff,
        gTranslate,
        help,
        history,
        historyTab,
        info,
        key,
        mdiArrowBottomLeft,
        notifications,
        otherHouses,
        profileTab,
        send,
        settings,
        twoFa,
        visibilityOff,
        widgets
      ];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/app_launcher.png
  AssetGenImage get appLauncher =>
      const AssetGenImage('assets/logo/app_launcher.png');

  /// File path: assets/logo/basic_icon.png
  AssetGenImage get basicIcon =>
      const AssetGenImage('assets/logo/basic_icon.png');

  /// File path: assets/logo/basic_logo_black.png
  AssetGenImage get basicLogoBlack =>
      const AssetGenImage('assets/logo/basic_logo_black.png');

  /// File path: assets/logo/basic_logo_white.png
  AssetGenImage get basicLogoWhite =>
      const AssetGenImage('assets/logo/basic_logo_white.png');

  /// File path: assets/logo/ios_launcher.jpg
  AssetGenImage get iosLauncher =>
      const AssetGenImage('assets/logo/ios_launcher.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [appLauncher, basicIcon, basicLogoBlack, basicLogoWhite, iosLauncher];
}

class Assets {
  Assets._();

  static const $AssetsClipartGen clipart = $AssetsClipartGen();
  static const $AssetsIconGen icon = $AssetsIconGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
