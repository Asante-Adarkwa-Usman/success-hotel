import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/constants/app_color.dart';
import 'package:totel/controller/main_controller.dart';
import 'package:totel/widgets/custom_app_bar.dart';
import 'package:totel/widgets/profile_view.dart';

import '../../widgets/offer_card.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({Key? key}) : super(key: key);

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

              const Text(
                'Offers',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var offer in mainController.offersList)
                        OfferCard(
                          user: offer.user,
                          offer: offer,
                          onTap: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                enableDrag: true,
                                isScrollControlled: true,
                                constraints: BoxConstraints(
                                    minHeight: Get.width * 0.3,
                                    maxHeight: Get.height *
                                        0.8), // 0.8 is the height of the modal
                                context: context,
                                builder: ((context) {
                                  return ProfileView(
                                    offer: offer,
                                    user: offer.user,
                                  );
                                }));
                          },
                        ),
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
