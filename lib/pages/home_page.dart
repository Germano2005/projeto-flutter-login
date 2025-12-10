import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/num_alet.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({super.key});

  @override
  State<PaginaInicial> createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meu teste app",
         // style: GoogleFonts.pacifico(),
          ),
      ),
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Container(
                color: Colors.cyan,
                child: Text("Ações do usuário",
                    style: GoogleFonts.acme(fontSize: 20)
                ),
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.yellow,
              child: Text("Foi clicado $quantidadeCliques vezes",
                  style: GoogleFonts.acme(fontSize: 20)
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.deepOrangeAccent,
              child: Text("O número gerado foi: $numeroGerado",
                  style: GoogleFonts.acme(fontSize: 20)
                ),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
                      child: Text("Nome: ",
                          style: GoogleFonts.acme(fontSize: 20)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.yellow,
                      child: Text("Germano Coelho",
                          style: GoogleFonts.acme(fontSize: 20)
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                      child: Text("30",
                          style: GoogleFonts.acme(fontSize: 20)
                      ),
                    ),
                  ),
                ],),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            quantidadeCliques++;
            numeroGerado =  GeradorNumAlet.gerarUmNumeroAle(10);
          });
        },
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}