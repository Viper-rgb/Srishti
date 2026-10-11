import 'package:flutter/material.dart';

class WorkerShop extends StatefulWidget {
  const WorkerShop({super.key});

  @override
  State<WorkerShop> createState() => _WorkerShopState();
}

class _WorkerShopState extends State<WorkerShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.arrow_back_ios),
      title: Text("Shop",style: TextStyle(fontSize: 20,fontFamily: 'serif'),),),
    body: Column(
      children: [
        ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return ;
          },
        ),
      ],
    ),
      
    );
  }
}