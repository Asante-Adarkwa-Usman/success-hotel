import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/route/route.dart' as router;

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, this.showBackButton = false}) : super(key: key);
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      if (showBackButton) ...[
        InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        const SizedBox(width: 10)
      ],
      Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/logo.png')),
        ),
      ),
      const SizedBox(width: 15),
      const Expanded(
        child: Text('Success Hotel',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
      ),
      const SizedBox(width: 5),
      _iconButton(
          Icons.notifications, () => Get.toNamed(router.notificationPage)),
    ]);
  }

  Widget _iconButton(IconData icon, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
