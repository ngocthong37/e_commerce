import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxCheckOut extends StatelessWidget {
  const BoxCheckOut({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(180),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        ),
        boxShadow:
        [ 
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 20
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        child: Column(
          children: [
              Row(
                children: [
                  Container(
                    height: getProportionateScreenHeight(40),
                    width: getProportionateScreenWidth(40),
                    padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                    ),
                    child: SvgPicture.asset("assets/icons/receipt.svg")
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Add voucher code",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(13)
                      ),
                    ),
                  ),
                  SizedBox(width: getProportionateScreenWidth(5),),
                  SvgPicture.asset("assets/icons/arrow_right.svg")
                ],
              ),
            SizedBox(height: getProportionateScreenHeight(20),),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total\n",
                    style: TextStyle(fontSize: getProportionateScreenWidth(15)),
                    children: [
                      TextSpan(text: "\$333.77", style: TextStyle(
                        color: kSecondaryColor
                      ))
                    ]
                  )
                ),
                Spacer(),
                SizedBox(
                  width: getProportionateScreenWidth(200),
                  child: DefaultButton(
                    text: "Check Out", 
                    press: () {}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}