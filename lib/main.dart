import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ntt_travel/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme(), primarySwatch: Colors.purple),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
