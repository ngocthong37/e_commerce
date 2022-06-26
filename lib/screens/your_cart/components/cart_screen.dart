import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/your_cart/components/body.dart';
import 'package:e_commerce/screens/your_cart/components/box_check_out.dart';
import 'package:flutter/material.dart';

class YourCartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const YourCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "3 items",
              style: TextStyle(
                  color: kSecondaryColor,
                  fontSize: getProportionateScreenWidth(12)),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: Body(),
      bottomNavigationBar: BoxCheckOut(),
    );
  }
}



