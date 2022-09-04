import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/constants/app_color.dart';
import 'package:totel/route/route.dart' as router;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(router.parentPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 150,
              height: 100,
              margin: const EdgeInsets.only(bottom: 130),
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage('assets/logo.png'), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text('Success Hotel',
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.selectedItemColor,
                  fontWeight: FontWeight.w400,
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Optimized by Usman',
                style: TextStyle(
                  color: AppColor.selectedItemColor,
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
