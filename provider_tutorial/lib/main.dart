import 'package:flutter/material.dart';

void main(){

runApp(const name());

}
class name extends StatelessWidget {
  
  const name({super.key});

  @override
  
  Widget build(BuildContext context) {
     

    return MaterialApp(
      home: exam(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class exam extends StatefulWidget {
  const exam({super.key});
  

  @override
  State<exam> createState() => _examState();
}

class _examState extends State<exam> {
     
  
    List <int> numbers = [12,2,3,4,5];

  
  
  @override
  Widget build(BuildContext context) {

          int lastnumber = numbers.last;

    return Scaffold(

      body:


    
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(

            
            children: [
             
              Text(lastnumber.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

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