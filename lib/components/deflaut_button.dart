import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({Key? key, required this.text, required this.press})
      : super(key: key);
  final String text;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: kPrimaryColor,
          onPressed: () {
            press();
          },
          child: Text(
            text,
            style: TextStyle(fontSize: getProportionateScreenWidth(14)),
          )),
    );
  }
}
