import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whats_app_clone/screen/login/auth/ui/login.dart';
import 'package:whats_app_clone/screen/login/auth/ui/verification.dart';
import 'package:whats_app_clone/screen/welcome/ui/welcome_page.dart';
import 'package:whats_app_clone/utils/constant/routes.dart';

import 'common/theme/dark_theme.dart';
import 'common/theme/light_theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: WhatsAppClone()));
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "x-chat",
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routes: {
        Routes.welcome.toString(): (_) => const WelcomePage(),
        Routes.login.toString(): (_) => const LoginPage(),
        Routes.verification.toString(): (_) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return VerificationPage(
            smsCodeId: args['smsCodeId'] as String,
            phoneNumber: args['phoneNumber'] as String,
          );
        },
      },
      initialRoute: Routes.welcome.toString(),
    );
  }
}
