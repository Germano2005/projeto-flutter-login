import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/home_page.dart';
import 'package:trilhaapp/pages/login_page.dart';

class MinhaApp extends StatelessWidget {
  const MinhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu teste de app',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
        ),
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: const loginPage(),
    );
  }
}