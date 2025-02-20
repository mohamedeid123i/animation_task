import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 700,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60)
              ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/images/1.jpg',width: 300,height: 700,fit: BoxFit.cover,))),
            Positioned(
              top: 30,
                left: 20,
                child: Container(
              height: 50,
              width: 50,
              child: Icon(Icons.arrow_back),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(15)
                  ),
            )),
            Positioned(
                top: 30,
                right: 20,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.favorite_border_outlined),
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(15)
                  ),
                )),
            Positioned(
              bottom: 0,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.black.withOpacity(.5)
                ),
              ),
            )
          ],
        ),
        
      ),
    );
  }
}
