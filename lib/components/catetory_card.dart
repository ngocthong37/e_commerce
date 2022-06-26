import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.text,
    required this.image,
    required this.press,
  }) : super(key: key);

  final String text, image;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press;
      },
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        height: getProportionateScreenHeight(120),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(60),
                padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                    color: const Color(0xFFFFECDF),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset(image),
              ),
              SizedBox(height: getProportionateScreenHeight(5),),
              SizedBox(
                width: getProportionateScreenWidth(55),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                  ),
                  textAlign: TextAlign.center,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
