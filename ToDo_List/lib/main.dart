import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_me/Screens/Homepage.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:GoogleFonts.nunitoSansTextTheme(
         Theme.of(context).textTheme,
        ),
      ),
      home:Homepage(),
    );
  }
}
