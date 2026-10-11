import 'package:flutter/material.dart';

class RergisterPage extends StatefulWidget {
  const RergisterPage({super.key});

  @override
  State<RergisterPage> createState() => _RergisterPageState();
}

class _RergisterPageState extends State<RergisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Name",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
          SizedBox(
            height: 60,
            width: 300,
            child: TextFormField(
              
            ),
          )
        ],
      ),
    );
  }
}