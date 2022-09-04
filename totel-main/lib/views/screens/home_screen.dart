import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/constants/app_color.dart';
import 'package:totel/constants/static_data.dart';
import 'package:totel/controller/main_controller.dart';
import 'package:totel/widgets/custom_app_bar.dart';
import 'package:totel/widgets/offer_card.dart';
import 'package:totel/widgets/user_card.dart';
import '../../widgets/profile_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  // ignore: unused_field
  final MainController _mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: GetBuilder<MainController>(builder: (mainController) {
        return SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const CustomAppBar(),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Waiting for your offers ',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Obx(() {
                          return Text(
                            '(${mainController.waiting})',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              for (int i = 0; i < 3; i++)
                UserCard(
                  userRating: StaticData.users[i].userRating,
                  date: '${i * 3} min ago',
                  userName: StaticData.users[i].userName,
                  userImage: StaticData.users[i].userImage,
                  userOccupation: StaticData.users[i].userOccupation,
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
                            user: StaticData.users[i],
                          );
                        }));
                  },
                ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Recent Offers',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        Obx(() {
                          return Text(
                            '(${mainController.offers})',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              for (int i = 0;
                  mainController.offersList.length > i && i < 3;
                  i++)
                OfferCard(
                  user: mainController.offersList[i].user,
                  offer: mainController.offersList[i],
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
                            offer: mainController.offersList[i],
                            user: mainController.offersList[i].user,
                          );
                        }));
                  },
                ),
            ],
          ),
        ));
      }),
    );
  }
}
