import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class customSuffixIcon extends StatelessWidget {
  const customSuffixIcon({
    Key? key,
    required this.svgIcon
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(10),
          getProportionateScreenWidth(10), getProportionateScreenWidth(10)),
      child: SvgPicture.asset(svgIcon),
    );
  }
}