import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:moneymove/backend/utils/maintenance/maintenance_dialog.dart';
import 'backend/utils/network_check/dependency_injection.dart';
import 'controller/basic_settings/splash_onboard_controller.dart';
import 'language/language_controller.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  // Locking Device Orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // check internet connection
  InternetCheckDependencyInjection.init();
  GetStorage.init();
  // main app
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      designSize: const Size(414, 896),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // theme: Themes.light,
        // darkTheme: Themes.dark,
        // themeMode: Themes().theme,
        navigatorKey: Get.key,
        initialRoute: Routes.splashScreen,
        getPages: Routes.list,
        initialBinding: BindingsBuilder(
          () {
            Get.put(SystemMaintenanceController());

            Get.put(SplashOnboardController(), permanent: true);
            Get.put(LanguageController());
          },
        ),
        builder: (context, widget) {
          ScreenUtil.init(context);
          final languageController = Get.find<LanguageController>();
          return Obx(
            () => MediaQuery(
              data: MediaQuery.of(context)
                  .copyWith(textScaler: TextScaler.linear(isTab() ? 0.35 : 1)),
              child: Directionality(
                textDirection: languageController.isLoading
                    ? TextDirection.ltr
                    : languageController.languageDirection,
                child: widget!,
              ),
            ),
          );
        },
      ),
    );
  }
}
