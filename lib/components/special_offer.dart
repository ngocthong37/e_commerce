import 'package:e_commerce/components/special_offer_card.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
        child: Row(
          children: [
            SpecialOfferCard(
              category: "Smart Phone",
              image: "assets/images/Image Banner 2.png",
              numOfBrands: 12,
              press: () {
              },
            ),
            SpecialOfferCard(
              category: "Fashion",
              image: "assets/images/Image Banner 3.png",
              numOfBrands: 12,
              press: () {
              },
            ),
            SpecialOfferCard(
              category: "Shoes",
              image: "assets/images/shoes2.png",
              numOfBrands: 12,
              press: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}