import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/auth/login_page.dart';
import 'package:flutter_application_1/widgets/intro_screen.dart';
import 'package:flutter_application_1/utils/color.dart';
import 'package:flutter_application_1/utils/images_path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  _storeOnboardInfo() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('onBoard', true);
  }

  final PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = index == 2;
              });
            },
            children: const [
              IntroScreen(
                image: onBoardingImage1,
                title: "Les types de maison disponible",
                description:
                    "Des appartements aux villas trouver le logement qui vous convient",
                count: "1",
              ),
              IntroScreen(
                image: onBoardingImage2,
                title: "Eviter des déplacements inutiles",
                description:
                    "Accorder vous directement avec le propriétaire du logement ",
                count: "2",
              ),
              IntroScreen(
                image: onBoardingImage3,
                title: "Ce qui vous correspond",
                description: "Vous le trouverez ici, nul par ailleurs!",
                count: "3",
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                !onLastPage
                    ? GestureDetector(
                        onTap: () {
                          _controller.jumpToPage(2);
                        },
                        child: const Text(
                          "Passer ",
                          style: TextStyle(color: primary),
                        ),
                      )
                    : const Text(''),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: CustomizableEffect(
                    dotDecoration: const DotDecoration(
                      width: 12,
                      height: 8,
                      color: secondary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(2),
                        topRight: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(2),
                      ),
                      verticalOffset: 0,
                    ),
                    activeDotDecoration: DotDecoration(
                      width: 25,
                      height: 12,
                      color: primary,
                      rotationAngle: 180,
                      verticalOffset: -10,
                      borderRadius: BorderRadius.circular(50),
                      // dotBorder: DotBorder(
                      //   padding: 2,
                      //   width: 2,
                      //   color: Colors.indigo,
                      // ),
                    ),
                  ),
                ),
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          _storeOnboardInfo();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 50,
                          color: primary,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(
                              milliseconds: 500,
                            ),
                            curve: Curves.easeIn,
                          );
                        },
                        child: const Icon(
                          Icons.arrow_circle_right_rounded,
                          size: 30,
                          color: secondary,
                        ),
                      ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
