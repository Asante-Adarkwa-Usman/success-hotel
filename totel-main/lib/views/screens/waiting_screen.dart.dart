import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/constants/app_color.dart';
import 'package:totel/controller/main_controller.dart';
import 'package:totel/constants/static_data.dart';
import 'package:totel/views/screens/offer_form.dart';
import 'package:totel/widgets/custom_app_bar.dart';
import 'package:totel/widgets/custom_button.dart';
import 'package:totel/widgets/user_card_with_checkbox.dart';

import '../../widgets/profile_view.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

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
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: const [
                        Text(
                          'Waiting users',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      mainController.onAllSelect();
                    },
                    child: Text(
                      mainController.isAllSelected()
                          ? 'Unselect All'
                          : 'select All',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Checkbox(
                      activeColor: AppColor.primaryColor,
                      value: mainController.isAllSelected(),
                      onChanged: (val) {
                        mainController.onAllSelect();
                      }),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var user in StaticData.users)
                        UserCardCheckBox(
                          isSelected: mainController.isUserSelected(user),
                          onSelect: (val) {
                            mainController.onUserSelectionUpdate(
                                val ?? true, user);
                          },
                          userRating: user.userRating,
                          date: '2 min ago',
                          userName: user.userName,
                          userImage: user.userImage,
                          userOccupation: user.userOccupation,
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
                                    user: user,
                                  );
                                }));
                          },
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Send Offer',
                      onTap: () {
                        if (mainController.selectedUsers.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Please select at least one user to send offer',
                                style: TextStyle(color: Colors.white),
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          Get.to(() => const OfferForm());
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      )),
    );
  }
}
