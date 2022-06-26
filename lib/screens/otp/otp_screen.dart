import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);
  static String routeName = "/otp";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "OTP Verification",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                "Complete Profile",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(30),
                    color: Colors.black),
              ),
              SizedBox(height: getProportionateScreenHeight(15)),
              Text(
                "We sent your code to 0329382***\n",
                style: TextStyle(fontSize: getProportionateScreenWidth(14)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("This code will expired in ",
                      style:
                          TextStyle(fontSize: getProportionateScreenWidth(14))),
                  TweenAnimationBuilder(
                      tween: Tween<double>(begin: 30.0, end: 0),
                      duration: const Duration(seconds: 30),
                      builder: (context, double value, child) => Text(
                          "${value.toInt()}",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14),
                              color: Colors.red)))
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              OtpForm(),
              SizedBox(height: getProportionateScreenHeight(25)),
              DefaultButton(
                  text: "Continue",
                  press: () {

                    Navigator.pushReplacementNamed(context, "/login");
                  }),
              SizedBox(height: SizeConfig.screenHeight * 0.3),
              const Text(
                "Resend OTP code",
                style: TextStyle(decoration: TextDecoration.underline),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  Widget build(BuildContext context) {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(90),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              obscureText: true,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
              ),
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin2FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(90),
            child: TextField(
              focusNode: pin2FocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              obscureText: true,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
              ),
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin3FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(90),
            child: TextField(
              focusNode: pin3FocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              obscureText: true,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
              ),
              decoration: otpInputDecoration,
              onChanged: (value) {
                nextField(value, pin4FocusNode);
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(90),
            child: TextField(
              focusNode: pin4FocusNode,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              obscureText: true,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
              ),
              decoration: otpInputDecoration,
              onChanged: (value) {
                pin4FocusNode.unfocus();
              },
            ),
          ),
        ],
      ),
    );
  }

  

}

