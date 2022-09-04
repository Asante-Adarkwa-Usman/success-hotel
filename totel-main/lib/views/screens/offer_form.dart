import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/constants/app_color.dart';
import 'package:totel/controller/main_controller.dart';
import 'package:totel/constants/static_data.dart';
import 'package:totel/widgets/custom_button.dart';

class OfferForm extends StatelessWidget {
  const OfferForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<MainController>(builder: (mainController) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColor.primaryColor,
                        )),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Make an amazing offer',
                        style: TextStyle(
                            fontSize: 22,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          keyboardType: TextInputType.number,
                          controller: mainController.priceController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Price',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Date',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            Row(
                              children: [
                                Text(
                                  '${mainController.selectedDate.day}/${mainController.selectedDate.month}/${mainController.selectedDate.year}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now()
                                            .add(const Duration(days: 30)));
                                    if (pickedDate != null) {
                                      mainController.onDateChange(pickedDate);
                                    }
                                  },
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'offer for ',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            DropdownButton(
                                value: mainController.selectedDays,
                                items: [
                                  for (var days in StaticData.days)
                                    DropdownMenuItem(
                                        value: days, child: Text(days)),
                                ],
                                onChanged: (val) {
                                  mainController.onDayChange(val.toString());
                                })
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Room Type',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            ),
                            DropdownButton(
                                value: mainController.roomType,
                                items: [
                                  for (var type in StaticData.roomTypes)
                                    DropdownMenuItem(
                                        value: type, child: Text(type)),
                                ],
                                onChanged: (val) {
                                  mainController
                                      .onRoomTypeChange(val.toString());
                                })
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Facilities',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 5),
                        Wrap(
                          children: [
                            for (var facility in StaticData.facilities)
                              InkWell(
                                onTap: () {
                                  mainController.onFacilitiesTap(facility);
                                },
                                child: Card(
                                  color: mainController
                                          .isFacilitySelected(facility)
                                      ? AppColor.primaryColor
                                      : Colors.white,
                                  elevation: 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      facility,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: mainController
                                                  .isFacilitySelected(facility)
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'Message (optional)',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 5),
                        TextField(
                          controller: mainController.messageController,
                          maxLines: 7,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Message',
                            // labelText: 'Message...',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {
                    mainController.onSendOffer();
                  },
                  text: 'Send Offer',
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
