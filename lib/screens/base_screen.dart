import 'package:flutter/material.dart';
import 'package:flutter_classified/screens/screens.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HomeScreen(),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }
}
