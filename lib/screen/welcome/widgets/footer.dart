import 'package:flutter/material.dart';
import 'package:whats_app_clone/utils/constant/app_text.dart';

import '../../../widgets/custom_text.dart';
import 'agree_button.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: [
          CustomText.regularText(AppText.readPrivacy,color: Colors.grey.shade600),

          const AgreeButton()

        ],
      ),
    );
  }
}
