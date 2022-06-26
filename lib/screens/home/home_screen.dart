import 'package:e_commerce/components/product_card.dart';
import 'package:e_commerce/components/section_title.dart';
import 'package:e_commerce/components/special_offer.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/detail_product/detail_product_screen.dart';
import 'package:e_commerce/screens/home/components/category.dart';
import 'package:e_commerce/screens/home/components/discount_banner.dart';
import 'package:e_commerce/screens/home/components/head_buider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        child: HeadBuilder(),
      ),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      DiscountBanner(),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      const Categories(),
      const SectionTitle(
        title: "Special for you",
        seeMore: "See More",
      ),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      SpecialOffer(),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      const SectionTitle(
        title: "Popular Product",
        seeMore: "See More",
      ),
      SizedBox(
        height: getProportionateScreenHeight(10),
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...List.generate(
                  demoProducts.length,
                  (index) => ProductCard(
                    product: demoProducts[index],
                    press: () {
                      Navigator.of(context).pushNamed(
                          DetailProductScreen.routeName,
                          arguments: ProductDetailArguments(
                              product: demoProducts[index]));
                    },
                  )
                )
            ],
          ),
        ),
      )
    ]))));
  }  
}





