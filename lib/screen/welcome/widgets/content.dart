import 'package:flutter/material.dart';

import '../../../utils/constant/images_url.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Image.asset(ImagesUrl.welcomeImage,color: Colors.green,),
      ),
    );
  }
}
