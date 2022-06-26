import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/components/error_form.dart';
import 'package:e_commerce/components/no_account_text.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/complete/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../components/custom_suffix_icon.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static String routeName = "/signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign Up",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(10)),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  "Register Account",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(25),
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Complete your details or continue \nwith social media",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String confirmPassword = "";
  final List<String> errors = [];

  void addError(String error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError(String error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildFormEmailField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildFormPasswordField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildFormConfirmField(),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context)
                        .pushNamed(CompleteProfieScreen.routeName);
                  }
                }),
            SizedBox(
              height: SizeConfig.screenHeight * 0.06,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocalCard(
                  image: "assets/icons/facebook-2.svg",
                  press: () {},
                ),
                SocalCard(
                  image: "assets/icons/google-icon.svg",
                  press: () {},
                ),
                SocalCard(
                  image: "assets/icons/twitter.svg",
                  press: () {},
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            const Text(
              "By continuing your confirm that you agree\n with our Term and Conditions",
              textAlign: TextAlign.center,
            )
          ],
        ));
  }

  TextFormField buildFormEmailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          suffixIcon: customSuffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }

  TextFormField buildFormPasswordField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (errors.isNotEmpty) {
          removeError(kEmailNullError);
        }
        if (value.length >= 8) {
          removeError(kShortPassError);
        }
        // gan bien
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kEmailNullError);
          return "";
        } else if (value.length < 8) {
          addError(kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          suffixIcon: customSuffixIcon(svgIcon: "assets/icons/Lock.svg")),
    );
  }

  TextFormField buildFormConfirmField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPassNullError);
        }
        if (confirmPassword == password) {
          removeError(kMatchPassError);
        }
        // gan bien
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPassNullError);
          return "";
        } else if (value != password) {
          addError(kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Confirm password",
          hintText: "Re-enter your password",
          suffixIcon: customSuffixIcon(svgIcon: "assets/icons/Lock.svg")),
    );
  }
}
