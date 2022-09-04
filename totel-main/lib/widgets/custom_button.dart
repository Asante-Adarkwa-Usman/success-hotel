import 'package:flutter/material.dart';
import 'package:totel/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, this.onTap, this.text = 'button title'})
      : super(key: key);
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )),
    );
  }
}
