import 'package:e_shop/presentation/screen/home_screen.dart';
import 'package:e_shop/presentation/screen/sineup_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/custom_button.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late PageController _pageController;
  // double _progress;
  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        _pageController.hasClients ? (_pageController.page!.toDouble()) : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text("E Shop"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animation/intro.json',
                height: 280 - progress * 128),
            //Lottie.asset('assets/animation/animation_lmkxvgei.json',height: 50),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 400 + progress * 140,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                const SizedBox(height: 16),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    children: const [
                      LoginScreen(),
                      SineUpScreen(),
                      //SineUpScreen(),
                    ],
                  ),
                ),
              ],
            ),
            // if( MediaQuery.of(context).viewInsets.bottom<1)
            Positioned(
                top: 300 + progress * 135,
                height: 100,
                // bottom: 5,
                right: 16,
                child: DefaultTextStyle(
                  style:const TextStyle(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) =>const HomeScreen()));
                        },
                        child: Stack(
                          fit: StackFit.passthrough,
                          children: [
                            Opacity(
                                opacity: 1 - progress,
                                child: const CustomButton(buttonName: "LOGIN")),
                            Opacity(
                                opacity: progress,
                                child:
                                    const CustomButton(buttonName: "Sine up")),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      DefaultTextStyle(
                        style: const TextStyle(fontSize: 15, color: Colors.blue),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.centerRight,
                                children: [
                                  Opacity(
                                    opacity: 1 - progress,
                                    child: Text("Don't have an account ?"),
                                  ),
                                  Opacity(
                                    opacity: progress,
                                    child: Text("Already an account ?"),
                                  ),
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    if (_pageController.page == 0) {
                                      _pageController.animateToPage(1,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.ease);
                                    } else if (_pageController.page == 1) {
                                      _pageController.animateToPage(0,
                                          duration:
                                              const Duration(milliseconds: 400),
                                          curve: Curves.ease);
                                    }
                                  },
                                  child: Stack(
                                      fit: StackFit.passthrough,
                                      alignment: Alignment.centerLeft,
                                      children: [
                                        Opacity(
                                          opacity: 1 - progress,
                                          child: const Text("SIGNUP"),
                                        ),
                                        Opacity(
                                          opacity: progress,
                                          child: const Text(
                                            "LOGIN",
                                            maxLines: 1,
                                            overflow: TextOverflow.fade,
                                          ),
                                        )
                                      ])),
                            ]),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
