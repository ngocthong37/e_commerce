import 'package:e_commerce/components/deflaut_button.dart';
import 'package:e_commerce/screens/splash/splash_content.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let's shop!",
      "image": "assets/images/splash_1.png",
    },
    {
      "text": "We have people connect with store \naround Viet Nam",
      "image": "assets/images/splash_2.png",
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: splashData.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]['image']!,
                    text: splashData[index]['text']!),
              )),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        splashData.length, (index) => buildDot(index)),
                  ),
                  const Spacer(),
                  DefaultButton(
                    text: "Continue",
                    press: () {
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    },
                  ),
                  const Spacer()
                ],
              ),
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      height: 10,
      width: index == currentPage ? 30 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
