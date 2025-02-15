import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter"),centerTitle: true,),
      body: Center(
        child: TweenAnimationBuilder(
          tween: IntTween(begin: 0,end: 100),
          duration: Duration(seconds: 5),
          builder: (context , value , child) {
            return Text(value.toString(),style: TextStyle(
              fontSize: 120,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent
            ),);

        },
        ),
      ),
    );
  }
}
