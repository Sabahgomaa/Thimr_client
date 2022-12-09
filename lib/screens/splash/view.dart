import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:thimar_client/screens/auth_cycle/log_in/view.dart';
import 'package:thimar_client/screens/nav_bar/view.dart';
import 'package:thimar_client/shared/core/cach_helper.dart';

// ignore: must_be_immutable
class SplashScreen extends StatefulWidget {
  Widget? page;

  String? token = CacheHelper.getUserToken();
   SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
   // Timer(const Duration(seconds: 2), () {});
  }
  startTimer() async {
    print(widget.token);
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    // SplashCubit().getData(context);
    if (widget.token != null) {
      widget.page = HomeView();
    } else {
      widget.page = LogInScreen();
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget.page!));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/splash_main_bg.jpg',
                  //  Assets.images.splashMainBg.path,
                  ),
                  fit: BoxFit.fill)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SlideInDown(
                child: Transform(
                  transform: Matrix4.translationValues(12.w, -60.h, 0),
                  child: SvgPicture.asset(
                   "assets/images/svg_images/papers.svg"
                      // Assets.images.svgImages.papers
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Image.asset(
                      "assets/images/svg_images/rest.png",
                      //Assets.images.svgImages.rest.path,
                      width: 150.h,
                      height: 125.h,
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          CacheHelper.getLang() == "en" ? -90 : -17, 6, 0),
                      child: FlipInY(
                        duration: const Duration(seconds: 3),
                        child: SvgPicture.asset(
                          "assets/images/svg_images/line.svg",
                        //Assets.images.svgImages.line,
                          height: 100.h,
                          width: 84.w,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
