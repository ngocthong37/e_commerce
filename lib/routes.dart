import 'package:e_commerce/screens/complete/complete_profile_screen.dart';
import 'package:e_commerce/screens/detail_product/detail_product_screen.dart';
import 'package:e_commerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/login/login_screen.dart';
import 'package:e_commerce/screens/login/login_success.dart';
import 'package:e_commerce/screens/otp/otp_screen.dart';
import 'package:e_commerce/screens/sign_up/sign_up_screen.dart';
import 'package:e_commerce/screens/splash/splash_screen.dart';
import 'package:e_commerce/screens/your_cart/components/cart_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  LoginScreen.routeName:(context) => LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfieScreen.routeName: (context) => CompleteProfieScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailProductScreen.routeName: (context) => DetailProductScreen(),
  YourCartScreen.routeName: (context) => YourCartScreen()
};
