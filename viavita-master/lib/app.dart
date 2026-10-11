import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:via_vita_mobile_app/CommonScreens/routes.dart';
import 'package:via_vita_mobile_app/CommonScreens/spalsh_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiprovider,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'poppins'
        ),
        home:Splashscreen()
      ),
    );
  }
}