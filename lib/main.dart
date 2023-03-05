import 'package:api_demo/Api/api_greed_view.dart';
import 'package:api_demo/Api/list_view.dart';
import 'package:api_demo/Assets/api_data.dart';
import 'package:api_demo/Screens/home_page.dart';
import 'package:api_demo/Screens/my_kart_page.dart';
import 'package:flutter/material.dart';

import 'Crud/data_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}