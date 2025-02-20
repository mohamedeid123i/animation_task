import 'package:flutter/material.dart';

import '../../../../Core/Constant/Colors.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: MyColors.baseColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Center(
        child:   TextField(
          decoration:   InputDecoration(
            prefixIcon: Icon(Icons.search , size: 26,),
            border: InputBorder.none,
            hintText: 'Find Your coffee',
            hintStyle: TextStyle(fontSize: 17,color: Colors.white54),
            contentPadding: EdgeInsets.only(top: 15),
          ),
        ),
      ),
    );
  }
}
