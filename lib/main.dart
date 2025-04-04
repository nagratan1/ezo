import 'package:ezo/MyRoutes/myPagesName.dart';
import 'package:ezo/MyRoutes/myroutename.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "",
      
      //theme: AppTheme.appTheme,
      initialRoute: MyPagesName.splash,
      getPages: MyRoute.list,
    );
  }
}
