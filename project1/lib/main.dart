import "package:flutter/material.dart";
void main (){
  runApp(name());
}
class name extends StatelessWidget {
  const name({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: todoapp(),
      debugShowCheckedModeBanner:false ,
    );
  }
}

class todoapp extends StatefulWidget {
  const todoapp({super.key});

  @override
  State<todoapp> createState() => _todoappState();
}

class _todoappState extends State<todoapp> {

  @override
 int itemcount = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text("Todo"),
            Text(itemcount.toString())
          ],
        ),
        actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.calendar_view_month_rounded),
         
          
         ),
         IconButton(onPressed: (){}, icon: Icon(Icons.settings_applications_rounded))
        ]
      ),
      body:SafeArea(
       child:  Column( 
        children: [
          SizedBox(height: 20,),
          TextFormField(
            controller: _todocontroller,
            decoration: const InputDecoration(
              labelText: 'Enter Task',
              border: OutlineInputBorder(),
              
            ),
            validator: (value){
              if(value==null || value.isEmpty)
              return 'enter your tasks';
            
            
  }
          ),
        const SizedBox(height: 20,),


        ],
      )
      )
    );
  }
}