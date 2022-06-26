import 'package:e_commerce/components/catetory_card.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"text": "Flash Deal", "image": "assets/icons/Flash Icon.svg"},
      {"text": "Bill", "image": "assets/icons/Bill Icon.svg"},
      {"text": "Game", "image": "assets/icons/Game Icon.svg"},
      {"text": "Daily Gift", "image": "assets/icons/Gift Icon.svg"},
      {"text": "More", "image": "assets/icons/Plus Icon.svg"},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...List.generate(
              categories.length,
              (index) => CategoryCard(
                    text: categories[index]['text'],
                    image: categories[index]['image'],
                    press: () {},
                  ))
        ],
      ),
    );
  }
}
