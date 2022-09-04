import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:totel/constants/app_color.dart';
import 'package:totel/controller/main_controller.dart';
import 'package:totel/models/offer_model.dart';
import 'package:totel/models/user_model.dart';
import 'package:totel/views/screens/offer_form.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key, this.offer, this.user}) : super(key: key);
  final UserModel? user;
  final OfferModel? offer;
  final MainController mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    )),
              ],
            ),
            // const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 25),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image:
                              AssetImage(user?.userImage ?? 'assets/logo.png'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mr./Mrs.',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        user?.userName ?? '',
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 25),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 30, 10, 10),
                child: Column(
                  children: [
                    if (offer != null)
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              getOfferDetailsText(offer!),
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColor.backgroundColor),
                      child: Column(
                        children: [
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Row(
                              children: const [
                                Text('Actions',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 15),
                            child: Column(
                              children: [
                                _actionCard('Send Offer', Icons.send, () {
                                  Get.back();
                                  mainController.selectedUsers.clear();
                                  mainController.selectedUsers
                                      .add(user ?? UserModel());
                                  Get.to((() => const OfferForm()));
                                }),
                                _actionCard('Add Note', Icons.add, null),
                                _actionCard('Chat', Icons.message, null),
                                _actionCard('Report', Icons.report, null),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String getOfferDetailsText(OfferModel offer) {
    return (offer.facilities ?? []).isNotEmpty
        ? 'Offer sent for ${offer.offerPrice} for ${offer.days} of ${offer.roomType} room with ${offer.facilities?.join(',')}.'
        : 'Offer sent for ${offer.offerPrice} for ${offer.days} of ${offer.roomType} room.';
  }

  Widget _actionCard(String text, IconData icon, onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black)),
                const SizedBox(width: 10),
                Icon(
                  icon,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
