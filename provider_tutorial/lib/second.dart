import 'package:flutter/material.dart';
import 'package:provider_tutorial/main.dart'

class Second extends StatefulWidget {
  final List<int> numbers;
  const Second({super.key, required this.numbers});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:


    
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            
            children: [
             
              Text(widget.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

               FloatingActionButton(onPressed: (){
               setState(() {
                numbers.add(lastnumber +1);
               });

              },
               child: Icon(Icons.add),
              ),
             Expanded(
              child:
               
                 Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: ListView.builder(itemCount: numbers.length, itemBuilder: ((context, index) {
                    return Padding(
                      padding:EdgeInsets.all(30), 
                      child: 
                        Text(numbers[index].toString())
                      
                      
                    );              
                                })
                                ),
                 ),
                  ), 
              ElevatedButton(onPressed: (){
                  
              },
               child:Text("Second",style: TextStyle(fontSize: 20),) 
               ),
            ]
          )
             )
        
            
          ),
        );
  }
}