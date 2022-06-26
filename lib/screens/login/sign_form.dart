import 'package:e_commerce/components/custom_suffix_icon.dart';
import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/components/error_form.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/login/login_success.dart';
import 'package:flutter/material.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email = "", password = "";
  bool remember = false;

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
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          buildEmailTextFormField(),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          buildPasswordTextFormField(),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Row(
            children: [
              Checkbox(
                  checkColor: kPrimaryColor,
                  value: remember,
                  onChanged: (value) {
                    setState(() {
                      remember = value!;
                    });
                  }),
              const Text("Remember me"),
              const Spacer(),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ForgotPasswordScreen.routeName);
                },
                child: const Text(
                  "Forgot password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pushNamed(context, HomeScreen.routeName);
                }
              }),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          print("Xoa 1");
          removeError(kPassNullError);
        } 
        if (value.length >= 8) {
          print("Xoa 2");
          removeError(kShortPassError);
        }
        return;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPassNullError);
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

  TextFormField buildEmailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kEmailNullError);
        } 
        if (emailValidatorRegExp.hasMatch(value)) {
          removeError(kInvalidEmailError);
        }
        return;
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
}
