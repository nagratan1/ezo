import 'dart:async';
import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

        
          void initState() {
            super.initState();
            Timer(const Duration(seconds: 4),() {
              Get.offNamed(MyPagesName.loginPage);
            });
          }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // backgroundColor: Color(0xff02166D),
      body:Center(
            child: Image.asset('assets/images/logo.jpeg'),
          ),
    );
  }
}

