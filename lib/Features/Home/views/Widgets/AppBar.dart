import 'package:flutter/material.dart';
import 'package:untitled4/Core/Constant/Colors.dart';
import 'package:untitled4/Features/Home/views/Widgets/image.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 55,
          height: 60,
          decoration: BoxDecoration(
              color: Color(0xff555861),
              borderRadius:BorderRadius.circular(18)
          ),
          child: Icon(Icons.grid_view,size: 30,),
        ),
        const Spacer(),

        CustomImage(width: 50 ,height: 50, imageUrl: 'assets/images/flutter.png',)

      ],
    );
  }
}

