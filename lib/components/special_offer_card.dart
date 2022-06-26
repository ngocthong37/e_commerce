import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.numOfBrands, required this.image, required this.press,
  }) : super(key: key);

  final String category;
  final int numOfBrands;
  final String image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
      child: InkWell(
        onTap: () {
          
        },
        child: SizedBox(
          height: getProportionateScreenHeight(100),
          width: getProportionateScreenWidth(165),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    const Color(0xFF343434).withOpacity(0.4),
                    const Color(0xFF343434).withOpacity(0.15)
                  ])),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: "$category\n",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(12),
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: "$numOfBrands brands", style: const TextStyle(color: Colors.white))
                ])),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
