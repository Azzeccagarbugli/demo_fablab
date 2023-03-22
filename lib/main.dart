import 'package:fablab_helper/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const FabLabHelper());

class FabLabHelper extends StatelessWidget {
  const FabLabHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FabLab Helper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
