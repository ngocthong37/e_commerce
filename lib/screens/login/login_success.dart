import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";
  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight*0.01,),
        Image.asset(
          "assets/images/success.png", 
          height: SizeConfig.screenHeight*0.6,),
        SizedBox(height: SizeConfig.screenHeight*0.05,),
        Text(
          "Login Success", 
          style: TextStyle(
            fontSize: getProportionateScreenWidth(25),
            fontWeight: FontWeight.bold
          ),),
        SizedBox(height: SizeConfig.screenHeight*0.05),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: DefaultButton(text: "Back to home", press: () {
            
          }),
        )
      ],
    ));
  }
}
