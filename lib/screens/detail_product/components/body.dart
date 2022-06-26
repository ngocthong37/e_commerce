import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/screens/detail_product/components/product_image.dart';
import 'package:e_commerce/components/rounded_btn.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/Product.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImage(product: product),
          TopRounded(
            color: Colors.white,
            child: ProductDescription(
              product: product,
              press: () {},
            ),
          ),
          TopRounded(
            color: Color(0XFFF6F7F9), 
            child: Row(
              children: [
                ColorDot(product: product),
                SizedBox(width: SizeConfig.screenWidth*0.3),
                RoundedIconButton(icon: Icons.remove, press: () {}),
                SizedBox(width: getProportionateScreenWidth(10),),
                RoundedIconButton(icon: Icons.add, press: () {})
              ],
            )
          ),
          Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            child: DefaultButton(text: "Add to Chart", press: () {}),
          )
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    int selectedProduct = 2;
    return Row(
      children: [
        Row(
          children: [
            ...List.generate(product.colors.length,
                (index) => ColorProduct(
                  color: product.colors[index],
                  isSelected: selectedProduct == index ? true : false,
                )
            )
          ],
        )
      ],
    );
  }
}

class ColorProduct extends StatelessWidget {
  const ColorProduct({
    Key? key,
    required this.color,
    required this.isSelected
  }) : super(key: key);

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(40),
      width: getProportionateScreenWidth(40),
      padding: EdgeInsets.all(getProportionateScreenWidth(3)),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected ? color : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.black)),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            //padding: EdgeInsets.all(getProportionateScreenWidth(5)),
            decoration: const BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
            height: getProportionateScreenHeight(40),
            width: getProportionateScreenWidth(70),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SvgPicture.asset(
                "assets/icons/Heart Icon_2.svg",
                color: product.isFavourite ? kPrimaryColor : Color(0xFFF5F6F9),
              ),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.7,
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        GestureDetector(
          onTap: () {
            press;
          },
          child: Row(
            children: [
              Text("See more detail",
                  style: TextStyle(
                      color: Colors.orange,
                      fontSize: getProportionateScreenWidth(13))),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              SvgPicture.asset(
                "assets/icons/arrow_right.svg",
                color: Colors.orange,
              )
            ],
          ),
        )
      ],
    );
  }
}

class TopRounded extends StatelessWidget {
  const TopRounded({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: getProportionateScreenWidth(20),
          top: getProportionateScreenHeight(20)),
      margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: child,
    );
  }
}
