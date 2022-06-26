import 'package:e_commerce/components/no_account_text.dart';
import 'package:e_commerce/screens/login/sign_form.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String routeName = "/login";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Sign In",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(20)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Sign in with your email and password \nor continue with social media",
                  style: TextStyle(fontSize: getProportionateScreenWidth(13)),
                  textAlign: TextAlign.center,
                ),
                const SignForm(),
                SizedBox(
                  height: getProportionateScreenHeight(100),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      image: "assets/icons/facebook-2.svg",
                      press: () {
      
                      },
                    ),
                    SocalCard(
                      image: "assets/icons/google-icon.svg",
                      press: () {
                      },
                    ),
                    SocalCard(
                      image: "assets/icons/twitter.svg",
                      press: () {
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                const NoAccountText()
              ],
            ),
          ),
        ),
      )
    );
  }
}

