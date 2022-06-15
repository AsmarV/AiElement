import 'package:ai_elements_task/Theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'Screens/page_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: AppColors.primeColor,
          elevation: 0.0
        )
      ),
      home: const PageOne(),
    );
  }
}