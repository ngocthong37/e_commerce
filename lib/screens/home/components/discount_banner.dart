import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.symmetric(
      horizontal: getProportionateScreenWidth(20),
      vertical: getProportionateScreenWidth(10),
    ),
    margin: EdgeInsets.symmetric(
      horizontal: getProportionateScreenWidth(20),
      vertical: getProportionateScreenWidth(10),
    ),
    height: getProportionateScreenHeight(90),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Color(0XFF4A3298), borderRadius: BorderRadius.circular(20)),
    child: Text.rich(
      TextSpan(
          text: "A Summer Suprise\n",
          style: TextStyle(
              color: Colors.white, fontSize: getProportionateScreenWidth(12)),
          children: [
            TextSpan(
                text: "Cashback 20%",
                style: TextStyle(fontSize: getProportionateScreenWidth(20)))
          ]),
    ),
    );
  }
}