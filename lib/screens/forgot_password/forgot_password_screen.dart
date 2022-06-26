import 'package:e_commerce/components/custom_suffix_icon.dart';
import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/components/error_form.dart';
import 'package:e_commerce/components/no_account_text.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Forgot password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Forgot password",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(30),
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Please enter your email and we will send \nyou a link to return to your account",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
              ),
              textAlign: TextAlign.center,
            ),
            ForgotPasswordFrom(),
          ],
        ),
      ),
    );
  }
}

class ForgotPasswordFrom extends StatefulWidget {
  const ForgotPasswordFrom({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordFrom> createState() => _ForgotPasswordFromState();
}

class _ForgotPasswordFromState extends State<ForgotPasswordFrom> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
    String email = "";
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (newValue) => email = newValue!,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                  setState(() {
                    errors.remove(kEmailNullError);
                  });
                } else if (emailValidatorRegExp.hasMatch(value) &&
                    errors.contains(kInvalidEmailError)) {
                  setState(() {
                    errors.remove(kInvalidEmailError);
                  });
                }
              },
              validator: (value) {
                if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                  setState(() {
                    errors.add(kEmailNullError);
                  });
                } else if (!emailValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kInvalidEmailError) &&
                    value.isNotEmpty) {
                  setState(() {
                    errors.add(kInvalidEmailError);
                  });
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  suffixIcon:
                      customSuffixIcon(svgIcon: "assets/icons/Mail.svg")),
            ),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(30),
            ),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                }),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            NoAccountText(),
          ],
        ),
      ),
    );
  }
}
