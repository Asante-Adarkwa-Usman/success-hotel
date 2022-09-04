import 'package:totel/models/user_model.dart';

class OfferModel {
  OfferModel(
      {this.user,
      this.offerPrice = '\$10',
      this.offerTime = '1 day ago',
      this.days = '1 day',
      this.roomType = 'Single',
      this.facilities,
      this.message = '',
      this.status = 'pending'});
  String offerTime, offerPrice, days, roomType, status, message;
  List? facilities;
  UserModel? user;
}
