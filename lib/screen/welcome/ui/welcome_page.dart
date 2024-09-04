import 'package:flutter/material.dart';
import 'package:whats_app_clone/screen/welcome/widgets/content.dart';
import 'package:whats_app_clone/screen/welcome/widgets/header_text.dart';
import '../widgets/footer.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff151C1C),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderText(),
            CustomImage(),
            Footer(),
          ],
        ),
      ),
    );
  }
}
