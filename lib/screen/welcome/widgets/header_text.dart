import 'package:flutter/material.dart';
import 'package:whats_app_clone/utils/constant/app_text.dart';

import '../../../utils/constant/app_text_size.dart';
import '../../../widgets/custom_text.dart';
class HeaderText extends StatelessWidget {
  const HeaderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: CustomText.customText(text:AppText.welcome,size: CustomTextSize.mediumSize32,color: Colors.white),
    );
  }
}
