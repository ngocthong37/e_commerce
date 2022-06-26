import 'package:e_commerce/components/custom_suffix_icon.dart';
import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/components/error_form.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/models/size_config.dart';
import 'package:e_commerce/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

class CompleteProfieScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  const CompleteProfieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
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
                const Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                CompleteForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CompleteForm extends StatefulWidget {
  const CompleteForm({Key? key}) : super(key: key);

  @override
  State<CompleteForm> createState() => _CompleteFormState();
}

class _CompleteFormState extends State<CompleteForm> {
  String firstName = "", lastName = "";
  String phoneNumber = "";
  String address = "";
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

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            buildFirstNameTextFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildLastNameTextFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildPhoneNumberTextFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildAddressTextFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
                text: "Continue",
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.of(context).pushNamed(OtpScreen.routeName);
                  }
                }),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            const Text(
              "By continuing your confirm that you agree \nwith our Term and Conditons",
              textAlign: TextAlign.center,
            )
          ],
        ));
  }

  TextFormField buildFirstNameTextFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kNamelNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "First Name",
          hintText: "Enter your first name",
          suffixIcon: customSuffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField buildLastNameTextFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kNamelNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Last Name",
          hintText: "Enter your last name",
          suffixIcon: customSuffixIcon(svgIcon: "assets/icons/User.svg")),
    );
  }

  TextFormField buildPhoneNumberTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kPhoneNumberNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Phone Number",
          hintText: "Enter your phone number",
          suffixIcon: customSuffixIcon(svgIcon: "assets/icons/Phone.svg")),
    );
  }

  TextFormField buildAddressTextFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(kAddressNullError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
          labelText: "Address",
          hintText: "Enter your address",
          suffixIcon:
              customSuffixIcon(svgIcon: "assets/icons/Location point.svg")),
    );
  }
}
