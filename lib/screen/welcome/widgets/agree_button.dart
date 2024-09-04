import 'package:flutter/material.dart';
import 'package:whats_app_clone/utils/constant/app_text.dart';
import 'package:whats_app_clone/widgets/custom_text.dart';

import '../../../utils/constant/app_text_size.dart';
import '../../../utils/constant/routes.dart';

class AgreeButton extends StatelessWidget {
  const AgreeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 30),
      child: ElevatedButton(onPressed: (){
        Navigator.pushReplacementNamed(context, Routes.login.toString());
      },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 13),
            backgroundColor: Colors.green.shade800,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
          ) ,
          child: CustomText.regularText(AppText.agreeAndContinue,size: CustomTextSize.regularSize16,fontWeight: FontWeight.bold)
      ),
    );
  }
}
