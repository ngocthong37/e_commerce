import 'package:e_commerce/components/icon_button_with_counter.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/your_cart/components/cart_screen.dart';
import 'package:flutter/material.dart';

class HeadBuilder extends StatelessWidget {
  const HeadBuilder({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: SizeConfig.screenWidth * 0.65,
          height: 50,
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onChanged: (value) {},
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: 'Search Product',
              contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(9))),
          ),
        ),
        IconBtnWithCounter(
          image: "assets/icons/Cart Icon.svg",
          numOfItems: 0,
          press: () {
            Navigator.of(context).pushNamed(YourCartScreen.routeName);
          }
        ),
        IconBtnWithCounter(
          image: "assets/icons/Bell.svg",
          numOfItems: 0,
          press: () {
            Navigator.of(context).pushNamed(YourCartScreen.routeName);
          },
        ),
      ],
    );
  }
}
