import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:untitled4/Counter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

late Animation<AlignmentGeometry>greenanimation;
/*late Animation<AlignmentGeometry>yellowanimation;
late Animation<AlignmentGeometry>redanimation;
late Animation<AlignmentGeometry>blackanimation;*/
late AnimationController greenController;
/*late AnimationController yellowController;
late AnimationController redController;
late AnimationController blackController;*/
@override
  void initState() {
  greenController = AnimationController(vsync: this ,duration: Duration(seconds: 2),reverseDuration: Duration(seconds: 2));
  /*yellowController = AnimationController(
      vsync: this ,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2));
  redController = AnimationController(
      vsync: this ,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2));
  blackController = AnimationController(
      vsync: this ,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2));*/
  greenanimation = Tween<AlignmentGeometry>(begin: Alignment.topCenter,end: Alignment.centerLeft).animate(CurvedAnimation(parent: greenController, curve: Curves.easeInOut));
   /* yellowanimation = Tween<AlignmentGeometry>(
        begin: Alignment.centerLeft,
        end: Alignment.bottomCenter).animate(CurvedAnimation(
        parent: yellowController,
        curve: Curves.easeInOut));
    redanimation = Tween<AlignmentGeometry>(begin: Alignment.centerRight,end: Alignment.topCenter).animate(CurvedAnimation(parent: redController, curve: Curves.easeInOut));
    blackanimation = Tween<AlignmentGeometry>(begin: Alignment.bottomCenter,end: Alignment.centerRight).animate(CurvedAnimation(parent: blackController, curve: Curves.easeInOut));*/
    /*greenController.addListener((){
      if(greenController.value >= .5 && yellowController.value == 0){
        yellowController.forward();
      }                                                                   //yellow movve after green reach to midlle
      if(greenController.value <= .5 && yellowController.value == 1){
        yellowController.reverse();
      }

  });*/
    /*greenanimation.addStatusListener((status){
      if(greenController.status == AnimationStatus.completed && yellowController.status == AnimationStatus.dismissed){
        yellowController.forward();
      }
      if(greenController.status == AnimationStatus.dismissed && yellowController.status == AnimationStatus.completed){
        yellowController.reverse();
      }
  });
    yellowanimation.addStatusListener((status){
    if(yellowController.status == AnimationStatus.completed && blackController.status == AnimationStatus.dismissed){
      blackController.forward();
    }
    if(yellowController.status == AnimationStatus.dismissed && blackController.status == AnimationStatus.completed){
      blackController.reverse();
    }
  });
    blackController.addStatusListener((status){
    if(blackController.status == AnimationStatus.completed && redController.status == AnimationStatus.dismissed){
      redController.forward();
    }
    if(blackController.status == AnimationStatus.dismissed && redController.status == AnimationStatus.completed){
      redController.reverse();
    }
  });*/

    super.initState();
  }
  @override
  void dispose() {
    greenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          showSearch(context: context, delegate: Custom_search());

        }, icon: const Icon(Icons.search)),
        actions: [
          PopupMenuButton(
            onSelected: (val){
              print(val);
            },
              itemBuilder: (context)=>[
            const PopupMenuItem(child: Text("one"),value: "one",),
            const PopupMenuItem(child: Text("two"),value: "two",),


          ])
        ],
        title: const Text("Home Page"),
        //centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              AlignTransition(
                alignment: greenanimation,
                child: const CircleAvatar(backgroundColor: Colors.green,),
              ),
               /*AlignTransition(
                alignment: yellowanimation,
                child: CircleAvatar(backgroundColor: Colors.yellow,),
              ),
              AlignTransition(
                alignment: redanimation,
                child: CircleAvatar(backgroundColor: Colors.red,),
              ),
              AlignTransition(
                alignment: blackanimation,
                child: CircleAvatar(backgroundColor: Colors.black,),
              ),*/
            ],
          )),
          Wrap(
            alignment: WrapAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                greenController.forward();
              },
                  child: Text("Forward")),
              ElevatedButton(onPressed: (){
                greenController.reverse();
              },
                  child: Text("Reverse")),
              ElevatedButton(onPressed: (){
                greenController.stop();
              },
                  child: Text("Stop")),
              ElevatedButton(onPressed: (){
                greenController.reset();
              },
                  child: Text("Reset")),
              ElevatedButton(onPressed: (){
                greenController.repeat();
              },
                  child: Text("Repeat(Reverse=flase)")),
              //SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                greenController.repeat(reverse: true);
              },
                  child: Text("Repeat(Reverse=true)")),


            ],
          )


        ],
      ),
    );
  }

}
 List names = [
   "mohamed",
   "ahmed",
   "ali",
   "mahmoud",
   "ibrahim",
   "eid"
 ];
 List? filternames;

class Custom_search extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: (){
        query = "";
      }, icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (){
        close(context, null);
      }, icon: const Icon(Icons.arrow_back));

  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("$query");

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == "") {
      return ListView.builder(
          itemCount: names.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: (){
                showResults(context);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(names[i], style: const TextStyle(fontSize: 18),),
                ),
              ),
            );
          }
      );
    }
    else{
      filternames = names.where((element) => element.contains(query)).toList();
      return ListView.builder(
          itemCount: filternames?.length,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: (){
                showResults(context);
              },
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(filternames?[i], style: const TextStyle(fontSize: 18),),
                ),
              ),
            );
          }
      );
    }
  }

  }
