import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Hello World", style: TextStyle(color: Colors.green)),
          SizedBox(height: 50,),
          Text("My Name Is Carl", style: TextStyle(color: Colors.blue)),
          Text("Peace Be With You"),
          Text("Joy To The World"),

          Row(
            children: [
              Text("New Word"),
              SizedBox(width: 50,),
              Text("Ramen"),         
            ],
          ),

          Container(
            height: 250, 
            width: 250,
            color: Colors.red,
            child:  Center(child: Text("Hello World")),
          ),

        ],
      ),  
    ); 
  }
}