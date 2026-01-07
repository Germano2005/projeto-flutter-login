import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/login_page.dart';

class MinhaApp extends StatelessWidget {
  const MinhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu teste de app',
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Cor primária
          // Define a cor que contrasta com o background (para textos)
        ),
      ),

      home: const loginPage(),
    );
  }
}