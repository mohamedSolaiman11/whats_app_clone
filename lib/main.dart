import 'package:flutter/material.dart';
import 'package:whats_app_clone/screen/welcome/ui/welcome_page.dart';

void main(){
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
