import 'package:flutter/material.dart';
import 'package:totel/models/offer_model.dart';
import 'package:totel/models/user_model.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({
    Key? key,
    this.user,
    this.offer,
    this.onTap,
  }) : super(key: key);
  final UserModel? user;
  final OfferModel? offer;

  final Function()? onTap;

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
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(
                                user?.userImage ?? 'assets/logo.png'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user?.userName ?? '',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${offer?.days} | ${offer?.roomType} | ${offer?.offerPrice}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        offer?.offerTime ?? '',
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        offer?.status ?? '',
                        style: TextStyle(
                            color: offer?.status == 'pending'
                                ? Colors.orange
                                : offer?.status == 'accepted'
                                    ? Colors.green
                                    : Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
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
