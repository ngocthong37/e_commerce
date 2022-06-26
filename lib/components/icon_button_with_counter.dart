import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key? key, required this.image, required this.numOfItems, required this.press
  }) : super(key: key);

  final String image;
  final int numOfItems;
  final GestureTapCallback press;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press;
      },
      borderRadius: BorderRadius.circular(30),
      child: Stack(clipBehavior: Clip.none, children: [
        Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            height: getProportionateScreenHeight(50),
            width: getProportionateScreenWidth(50),
            decoration: BoxDecoration(
                color: kSecondaryColor.withOpacity(0.1),
                shape: BoxShape.circle),
            child: SvgPicture.asset(image)),
        if(numOfItems != 0)
        Positioned(
          right: 0,
          top: -3,
          child: Container(
            height: getProportionateScreenHeight(16),
            width: getProportionateScreenWidth(16),
            decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Colors.white)),
            child: Center(
                child: Text(
              "$numOfItems",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(
                    10,
                  ),
                  color: Colors.white),
            )),
          ),
        ),
      ]),
    );
  }
}
