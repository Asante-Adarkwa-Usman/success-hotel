import 'package:flutter/material.dart';

import '../constants/app_color.dart';

class UserCardCheckBox extends StatelessWidget {
  const UserCardCheckBox(
      {Key? key,
      this.date = '',
      this.userImage = '',
      this.userName = '',
      this.userOccupation = '',
      this.onTap,
      this.onSelect,
      this.isSelected = false,
      this.userRating = ''})
      : super(key: key);
  final String userImage, userName, userOccupation, userRating, date;
  final bool isSelected;
  final Function()? onTap;
  final void Function(bool?)? onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(userImage),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: Checkbox(
                            activeColor: AppColor.primaryColor,
                            value: isSelected,
                            onChanged: onSelect),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          userOccupation,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        date,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.green),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Text(
                                  userRating,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
