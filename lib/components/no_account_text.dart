import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: getProportionateScreenWidth(14)),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(SignUpScreen.routeName);
          },
          child: Text(
            "Sign up",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: getProportionateScreenWidth(14)),
          ),
        )
      ],
    );
  }
}

class SocalCard extends StatelessWidget {
  const SocalCard({
    Key? key,
    required this.image,
    required this.press,
  }) : super(key: key);
  final String image;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenHeight(45),
        width: getProportionateScreenWidth(45),
        decoration: const BoxDecoration(
            color: Color(0XFFF5F6F9), shape: BoxShape.circle),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
