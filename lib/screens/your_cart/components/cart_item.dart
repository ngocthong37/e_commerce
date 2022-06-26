// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/size_config.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: getProportionateScreenHeight(100),
          width: getProportionateScreenWidth(100),
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset(cart.product.images[0]),
        ),
        SizedBox(
          width: getProportionateScreenWidth(20),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(demoCarts[0].product.title),
            Text.rich(TextSpan(
              text: "\$${cart.product.price}",
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: getProportionateScreenWidth(12)),
            ))
          ],
        )
      ],
    );
  }
}
