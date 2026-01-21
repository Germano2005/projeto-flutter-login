import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumAletPage extends StatefulWidget {
  const NumAletPage({super.key});

  @override
  State<NumAletPage> createState() => _NumAletPageState();
}

class _NumAletPageState extends State<NumAletPage> {

  int? numeroGerado;
  int? quantidadeDeCliques;
  final CHAVE_NUMERO_ALET = "num_alet";
  final CHAVE_QUANTIDADE_CLIQUES = "quantidade_cliques";
  late SharedPreferences storage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async{
    storage = await SharedPreferences.getInstance();

    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_ALET);
      quantidadeDeCliques = storage.getInt(CHAVE_QUANTIDADE_CLIQUES);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Numeros aleaorios"),
          ),
          body: Container(
            alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(numeroGerado == null ? "" : numeroGerado.toString(), style: TextStyle(fontSize: 20),),
                    Text(quantidadeDeCliques == null ? "Nenhum Clique" : quantidadeDeCliques.toString(), style: TextStyle(fontSize: 20),)
                  ],
                ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
              onPressed: () async{
                var rando = Random();
                setState(() {
                  numeroGerado = rando.nextInt(100);
                  quantidadeDeCliques =  (quantidadeDeCliques ?? 0) + 1;
                });
                storage.setInt(CHAVE_NUMERO_ALET, numeroGerado!);
                storage.setInt(CHAVE_QUANTIDADE_CLIQUES, quantidadeDeCliques!);
          }),
        )
    );
  }
}
