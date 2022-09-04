import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/constants/app_color.dart';
import 'package:totel/controller/main_controller.dart';
import 'package:totel/widgets/custom_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GetBuilder<MainController>(builder: (mainController) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const CustomAppBar(
                showBackButton: false,
              ),
              const SizedBox(height: 10),
              // filter card

              const SizedBox(height: 10),

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      Text(
                        'Settings',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      )),
    );
  }
}
