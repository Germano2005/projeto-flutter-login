import 'package:flutter/material.dart';
import 'package:trilhaapp/model/viacep_model.dart';
import 'package:trilhaapp/repositories/via_cep_repository.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {

  var cepController = TextEditingController(text: "");

  var viacepModel = ViaCEPModel();

  var viaCepRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Text("Consulta de CEP", style: TextStyle(fontSize: 18),),
              TextField(
                controller: cepController,
                maxLength: 8,
                onChanged: (String value) async{
                  var cep = value.trim().replaceAll("-", "");
                  if(cep.length == 8){
                    viacepModel = await viaCepRepository.consultarCEP(cep);
                    print(viacepModel);
                  }
                  setState(() {

                  });
                }
              ),
              SizedBox(
                height: 50,
              ),
              Text(viacepModel.logradouro ?? "", style: TextStyle(fontSize: 18),),
              Text("${viacepModel.localidade ?? ""} - ${viacepModel.estado ?? ""}", style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async{

            }
        ),
      ),
    );
  }
}
