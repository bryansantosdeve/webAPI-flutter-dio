import 'package:flutter/material.dart';
import 'package:studio_ghibli_studio/shared/custom_app_theme.dart';

import 'presentation/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Studio Ghibli Studio',
      theme: CustomAppTheme.light,
      home: MyHomePage(),
    );
  }
}
