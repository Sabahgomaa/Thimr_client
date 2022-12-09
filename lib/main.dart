import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar_client/screens/auth_cycle/log_in/view.dart';
import 'package:thimar_client/screens/splash/view.dart';
import 'package:thimar_client/shared/const/colors.dart';
import 'package:thimar_client/shared/router.dart';
import 'gen/fonts.gen.dart';
import 'generated/codegen_loader.g.dart';
import 'shared/const/kiwi.dart';
import 'shared/core/cach_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  //  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //      statusBarColor: Colors.black,
  //    statusBarIconBrightness:Brightness.light,
  // systemStatusBarContrastEnforced: true
  //
  //    // systemNavigationBarColor: Colors.green
  //  ));
  FirebaseMessaging.instance.getToken().then((value) {
    print(value);
  });
  // Future<void> initializeDefaultFromAndroidResource() async {
  //   if (defaultTargetPlatform != TargetPlatform.android || kIsWeb) {
  //     print('Not running on Android, skipping');
  //     return;
  //   }
  await CacheHelper.init();
  initKiwi();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      startLocale: Locale('ar'),
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: ScreenUtilInit(
        child: const MyApp(),
        designSize: Size(375, 812),
        builder: (context, child) => child!,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: Locale('ar'),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.green,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: AppColors.green,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
        fontFamily: FontFamily.regular,
      ),
      home: SplashScreen(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
    );
  }
}
