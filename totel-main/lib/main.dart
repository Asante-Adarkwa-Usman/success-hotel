import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/constants/app_color.dart';
import 'package:totel/views/screens/splash_screen.dart';
import 'package:totel/route/route.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task by Sherazi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: AppColor.primaryColor,
          onPrimary: Colors.white,
        ),
      ),
      home: const SplashScreen(),
      onGenerateRoute: router.generateRoute,
    );
  }
}
