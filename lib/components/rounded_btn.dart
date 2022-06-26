import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({Key? key, required this.icon, required this.press})
      : super(key: key);

  final IconData icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: Icon(icon),
    );
  }
}
