import 'package:flutter/material.dart';
import 'package:untitled4/Core/Constant/Colors.dart';
import 'package:untitled4/Features/Home/views/Widgets/AppBar.dart';
import 'package:untitled4/Features/Home/views/Widgets/CustomTextFiled.dart';
import 'package:untitled4/Features/Home/views/Widgets/image.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> items = const [
    'Cappuccino',
    'Esprsso',
    'Latte',
    'Juice',
    'Tea',
    'Coffee',
    'Tea With Milk',
  ];
  int _selectedIndex = 0;
  int navindex=3;
  List<Widget> screens=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[navindex]
      ,
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
         currentIndex: navindex,
          onTap: (value){
           setState(() {
             navindex=value;
           });
          },
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag),label: "shop"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "fav"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "notify")]),


    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 330,
      width: 200,
      decoration: BoxDecoration(
          color: MyColors.baseColor,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'assets/images/1.jpg',
                      width: 200,
                      height: 140,
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    right: 0,
                    child: Container(
                  width:70 ,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topRight: Radius.circular(18))
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star_rate , color: Colors.orange,),
                      Text('${4.5}',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ))
              ],

            ),
            SizedBox(height: 15,),
            Text(items[0] ,style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),),
            Text(items[0] ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal ,color: Colors.white54),),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('\$ 4.20',style: TextStyle(fontSize: 24),),
                Spacer(),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.orange,
                  ),
                  child: Center(child: Icon(Icons.add)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


// class HomeScreenwidget extends StatelessWidget {
//   const HomeScreenwidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomAppBar(),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             'Find the best\ncoffee for you',
//             style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
//           ),
//           SizedBox(
//             height: 40,
//           ),
//           CustomTextFiled(),
//           SizedBox(
//             height: 30,
//           ),
//           SizedBox(
//             height: 40,
//             child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: items.length,
//                 itemBuilder: (context, index) {
//                   return TextButton(
//                       onPressed: () {
//                         setState(() {
//                           _selectedIndex = index;
//                         });
//                       },
//                       child: Text(
//                         items[index],
//                         style: TextStyle(
//                             fontSize: 20,
//                             color: index == _selectedIndex
//                                 ? Colors.orange
//                                 : Colors.white54),
//                       ));
//                 }),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           SizedBox(height: 350,child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 6,itemBuilder: (context,index)=> ListViewItem(items: items)))
//           ,Text("Specified for you",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
//
//         ],
//       ),
//     );
//   }
// }
