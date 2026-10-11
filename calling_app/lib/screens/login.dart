import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
 final TextEditingController Namecontroller = TextEditingController();

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Text("login",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          SizedBox(
            height: 60,
            width: 200,
            child: TextFormField(
              
              decoration: InputDecoration(
              
              border: OutlineInputBorder(),hintText: "Enter your login details"
            
            ),
            controller: Namecontroller,
              validator: (value){
                if(Namecontroller.text.isEmpty)
                {
                  return "password is empty";
                }
                else{
                  return "password is not empty";
                 }
              },
            ),
          ),

          
        ],
      ),
    );
  }
}