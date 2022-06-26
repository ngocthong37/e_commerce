import 'package:e_commerce/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          List.generate(errors.length, (index) => formErrorBody(errors[index])),
    );
  }

  Row formErrorBody(String text) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/Error.svg"),
        Padding(
          padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
          child: Text(text),
        )
      ],
    );
  }
}
