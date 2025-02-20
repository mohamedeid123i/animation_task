import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key, required this.width, required this.height, required this.imageUrl,
  });
  final double width ;
  final double height;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: MyColors.baseColor,
          borderRadius:BorderRadius.circular(18)
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(imageUrl)),
    );
  }
}