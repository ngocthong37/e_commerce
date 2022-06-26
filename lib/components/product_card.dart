// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/models/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product, required this.press,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
            width: getProportionateScreenWidth(100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kSecondaryColor.withOpacity(0.1),
                    ),
                    child: Image.asset(product.images[0]),
                  ),
                ),
                Text(
                  product.title,
                  maxLines: 2,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${product.price}",
                      style: const TextStyle(color: Colors.red),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                        height: getProportionateScreenHeight(30),
                        width: getProportionateScreenWidth(30),
                        decoration: BoxDecoration(
                            color: product.isFavourite
                                ? kPrimaryColor.withOpacity(0.15)
                                : kSecondaryColor.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color:
                              product.isFavourite ? Colors.red : kSecondaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
