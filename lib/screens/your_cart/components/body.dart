import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/your_cart/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: demoCarts.length,
      itemBuilder: (context, index) => Dismissible(
        direction: DismissDirection.endToStart,
        key: Key(demoCarts[index].product.id.toString()),
        background: Container(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          decoration: BoxDecoration(
              color: const Color(0XFFFFE6E6),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Spacer(),
              SvgPicture.asset("assets/icons/Trash.svg"),
            ],
          ),
        ),
        onDismissed: (direction) {
          setState(() {
            demoCarts.removeAt(index);
          });
        },
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: CartItem(
            cart: demoCarts[index],
          ),
        ),
      ),
    );
  }
}
