import 'package:calling_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
void main (){
runApp(Calls());
}


class Calls extends StatelessWidget {
  const Calls({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScr(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Landing_page extends StatefulWidget {
  const Landing_page({super.key});

  @override
  State<Landing_page> createState() => _Landing_pageState();
}

class _Landing_pageState extends State<Landing_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         
    
    );
  }
}