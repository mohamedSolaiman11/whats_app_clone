import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whats_app_clone/common/extension/custom_theme_extension.dart';
import '../../../../widgets/custom_text_fields.dart';
import '../../widgets/custom_icon_button.dart';
import '../controller/auth_controller.dart';

class VerificationPage extends ConsumerStatefulWidget {
  const VerificationPage({
    super.key,
    required this.smsCodeId,
    required this.phoneNumber,
  });

  final String smsCodeId;
  final String phoneNumber;

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends ConsumerState<VerificationPage> {
  late Timer _timer;
  bool _codeNotReceived = false;

  @override
  void initState() {
    super.initState();
    _startVerificationTimeout();
  }

  void _startVerificationTimeout() {
    _timer = Timer(const Duration(seconds: 10), () {
      setState(() {
        _codeNotReceived = true; // عند انتهاء المؤقت، يتم تفعيل هذا الشرط
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void verifySmsCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProvider).verifySmsCode(
      context: context,
      smsCodeId: widget.smsCodeId,
      smsCode: smsCode,
      mounted: true,
    );
  }

  // void _navigateToUserInfoPage() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const UserInfoPage(), // افترضنا وجود صفحة دعم هنا
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Verify your number',
          style: TextStyle(
            color: context.theme!.authAppbarTextColor,
          ),
        ),
        actions: [
          CustomIconButton(
            onPressed: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(color: context.theme!.greyColor),
                  children: [
                    const TextSpan(
                      text:
                      "You've tried to register +201014250577. before requesting an SMS or Call with your code.",
                    ),
                    TextSpan(
                      text: "Wrong number?",
                      style: TextStyle(
                        color: context.theme!.blueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomTextField(
                hintText: "- - -  - - -",
                fontSize: 30,
                autoFocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 6) {
                    return verifySmsCode(context, ref, value);
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Enter 6-digit code',
              style: TextStyle(color: context.theme!.greyColor),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.message, color: context.theme!.greyColor),
                const SizedBox(width: 20),
                Text(
                  'Resend SMS',
                  style: TextStyle(
                    color: context.theme!.greyColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              color: context.theme!.greyColor!.withOpacity(.2),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.phone, color: context.theme!.greyColor),
                const SizedBox(width: 20),
                Text(
                  'Call Me',
                  style: TextStyle(
                    color: context.theme!.greyColor,
                  ),
                ),
              ],
            ),
            // const SizedBox(height: 20),
            // if (_codeNotReceived) // يظهر هذا القسم بعد انتهاء المؤقت
            //   TextButton(
            //     onPressed: _navigateToUserInfoPage,
            //     child: Text(
            //       'Didn\'t receive the code? Get help',
            //       style: TextStyle(color: context.theme!.blueColor),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

