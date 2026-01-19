import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NumAletPage extends StatefulWidget {
  const NumAletPage({super.key});

  @override
  State<NumAletPage> createState() => _NumAletPageState();
}

class _NumAletPageState extends State<NumAletPage> {

  int numeroGerado = 0;

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
                    Text(numeroGerado.toString(), style: TextStyle(fontSize: 20),)
                  ],
                ),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
              onPressed: () async{
              final storage = await SharedPreferences.getInstance();
                var rando = Random();
                setState(() {
                  numeroGerado = rando.nextInt(100);
                });
                storage.setInt("num_alet", numeroGerado);
                var num = storage.getInt("num_alet");
                print(num);
          }),
        )
    );
  }
}
