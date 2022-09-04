import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totel/constants/static_data.dart';
import 'package:totel/models/offer_model.dart';
import 'package:totel/models/user_model.dart';

class MainController extends GetxController {
  RxInt waiting = 0.obs;
  RxInt offers = 0.obs;
  TextEditingController priceController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  String selectedDays = '1 day';
  DateTime selectedDate = DateTime.now();
  String roomType = 'Single';
  List selectedFacilities = [];
  List<UserModel> selectedUsers = [];
  List<OfferModel> offersList = [];
  List<String> filterList = ['pending', 'accepted', 'rejected'];

  @override
  void onInit() {
    super.onInit();
    waiting.value = StaticData.users.length;
  }

  onDayChange(String value) {
    selectedDays = value;
    update();
  }

  onDateChange(DateTime value) {
    selectedDate = value;
    update();
  }

  onRoomTypeChange(String value) {
    roomType = value;
    update();
  }

  onFacilitiesTap(String value) {
    selectedFacilities.contains(value)
        ? selectedFacilities.remove(value)
        : selectedFacilities.add(value);
    update();
  }

  bool isFacilitySelected(String value) {
    return selectedFacilities.contains(value);
  }

  onUserSelectionUpdate(bool val, UserModel user) {
    selectedUsers.contains(user)
        ? selectedUsers.remove(user)
        : selectedUsers.add(user);
    update();
  }

  isUserSelected(UserModel user) {
    return selectedUsers.contains(user);
  }

  isAllSelected() {
    bool isAllSelected = true;
    for (var user in StaticData.users) {
      if (!isUserSelected(user)) {
        isAllSelected = false;
        break;
      }
    }
    return isAllSelected;
  }

  onAllSelect() {
    if (isAllSelected()) {
      selectedUsers.clear();
    } else {
      selectedUsers.addAll(StaticData.users);
    }
    update();
  }

  onSendOffer() {
    if (priceController.text == '') {
      _showError('Please enter offer price');
      return null;
    }
    for (var user in selectedUsers) {
      offersList.add(OfferModel(
        user: user,
        offerPrice: "\$${priceController.text}",
        offerTime:
            '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
        days: selectedDays,
        roomType: roomType,
        facilities: selectedFacilities,
        message: messageController.text,
        status: 'pending',
      ));
    }
    offers.value = offersList.length;
    clearForm();
    update();

    Get.back();
    _showSuccess('Offer sent successfully');
  }

  clearForm() {
    selectedUsers.clear();
    selectedFacilities.clear();
    priceController.clear();
    messageController.clear();
    selectedDate = DateTime.now();
    selectedDays = '1 day';
    roomType = 'Single';
  }

  _showError(String text) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red.withOpacity(0.7),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  _showSuccess(String text) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.withOpacity(0.7),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
