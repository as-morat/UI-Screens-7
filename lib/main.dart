import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/my_home_page.dart';
import 'package:learn_getx/routes/routes_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Learn Getx",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      initialRoute: RoutesNames.getInitial(),
      getPages: RoutesNames.routes,
      home: MyHomePage(),
    );
  }
}
