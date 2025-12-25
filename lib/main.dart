import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/content_page.dart';
import 'package:learn_getx/pages/my_detail_page.dart';
import 'package:learn_getx/pages/my_home_page.dart';

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
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => MyHomePage()),
        GetPage(name: "/content", page: () => ContentPage()),
        GetPage(name: "/detail", page: () => DetailPage())
      ],
      home: MyHomePage(),
    );
  }
}
