import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key, required this.title, required this.seeMore,
  }) : super(key: key);

  final String title, seeMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20), 
        right: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              
            },
            child: Text(
              seeMore,
              style: TextStyle(fontSize: getProportionateScreenWidth(13)),
            ),
          )
        ],
      ),
    );
  }
}
