import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_1/controller/getx_controller/splash.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
            backgroundColor:Colors.deepOrange,
            body: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'asset/splash.png',
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}