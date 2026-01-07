import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/widgets/text_label.dart';

class MeusDados extends StatefulWidget {
  const MeusDados({super.key});

  @override
  State<MeusDados> createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDados> {
  var nomeController = TextEditingController(text: "");
  var dataNascController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var linguagensSelecionadas = [];
  String nivelSelecionado = ""; // Mude para não-nulo com valor inicial
  double salarioEscolhido = 1000;
  int tempoExperiencia = 0;

  @override
  void initState() {
    niveis = nivelRepository.retornaveis();
    // Definir valor inicial obrigatório
    if (niveis.isNotEmpty) {
      nivelSelecionado = niveis[0];
    }
    linguagens = linguagensRepository.linguagens();
    super.initState();
  }

  List<DropdownMenuItem<int>> retornoItens(int qtdMax){
    var itens = <DropdownMenuItem<int>>[];

    for(var i = 0; i <= qtdMax; i++){
      itens.add(
          DropdownMenuItem(
            value: i,
            child: Text(i.toString(),
          )
      ));
    }
    return itens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: [
            const TextLabel(texto: "Nome"),
            TextField(
              controller: nomeController,
            ),
            const TextLabel(texto: "Data de Nascimento"),
            TextField(
              readOnly: true,
              controller: dataNascController,
              onTap: () async {
                var data = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime.now());
                if (data != null) {
                  dataNascController.text =
                  "${data.day}/${data.month}/${data.year}";
                  dataNascimento = data;
                }
              },
            ),
            const TextLabel(texto: "Nível de experiência"),
            // Solução 1: Usar RadioListTile com Column
            Column(
              children: niveis.map<Widget>((nivel) {
                return RadioListTile<String>(
                  value: nivel,
                  groupValue: nivelSelecionado, // Agora é String, não String?
                  onChanged: (String? value) {
                    if (value != null) { // Verificar se não é null
                      setState(() {
                        nivelSelecionado = value;
                      });
                    }
                  },
                  title: Text(nivel),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            TextLabel(texto: "Linguagens preferidas"),
            Column(
              children: linguagens
                  .map((linguagem) => CheckboxListTile(
                  dense: true,
                  title: Text(linguagem),
                  value: linguagensSelecionadas.contains(linguagem),
                  onChanged: (bool? value) {
                    if (value!) {
                      setState(() {
                        linguagensSelecionadas.add(linguagem);
                      });
                    } else {
                      setState(() {
                        linguagensSelecionadas.remove(linguagem);
                      });
                    }
                  }))
                  .toList(),
            ),
            TextLabel(texto: "Tempo de experiência"),
            DropdownButton(
              isExpanded: true,
                items: retornoItens(50), onChanged: (value){
                setState(() {
                  tempoExperiencia = int.parse(value.toString());
                });
            }),
            TextLabel(texto: "Pretenção Salarial. R\$ ${salarioEscolhido.round()}"),
            Slider(
                min: 1000,
                max: 100000,
                value: salarioEscolhido,
                onChanged: (double value){
                    setState(() {
                      salarioEscolhido = value;
                    });
            }),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  debugPrint("Nome: ${nomeController.text}");
                  debugPrint("Data de Nascimento: $dataNascimento");
                  debugPrint("Nível selecionado: $nivelSelecionado");
                  debugPrint("Linguagens preferidas: $linguagensSelecionadas");
                  debugPrint("Tempo de experiência: $tempoExperiencia");
                  debugPrint("Pretenção salarial: $salarioEscolhido");
                },
                child: const Text("Salvar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}