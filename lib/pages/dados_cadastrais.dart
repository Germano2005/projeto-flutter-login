import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';
import 'package:trilhaapp/widgets/text_label.dart';

class MeusDados extends StatefulWidget {
  const MeusDados({super.key});

  @override
  State<MeusDados> createState() => _MeusDadosState();
}

class _MeusDadosState extends State<MeusDados> {

  late SharedPreferences storage;

  var nomeController = TextEditingController(text: "");
  var dataNascController = TextEditingController(text: "");
  DateTime? dataNascimento;
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  List<String> linguagensSelecionadas = [];
  String nivelSelecionado = ""; // Mude para não-nulo com valor inicial
  double salarioEscolhido = 1000;
  int tempoExperiencia = 0;

  final String CHAVE_NOME_CADASTRO = "nome_cadastro";
  final String CHAVE_DATA_NASCIMENTO_CADASTRO = "data_nascimento_cadastro";
  final String CHAVE_NIVEL_CADASTRO = "nivel_cadastro";
  final String CHAVE_LINGUAGEM_CADASTRO = "linguagem_cadastro";
  final String CHAVE_TEMPO_CADASTRO = "tempo_cadastro";
  final String CHAVE_SALARIO_CADASTRO = "salario_cadastro";

  @override
  void initState() {
    niveis = nivelRepository.retornaveis();
    // Definir valor inicial obrigatório
    if (niveis.isNotEmpty) {
      nivelSelecionado = niveis[0];
    }
    linguagens = linguagensRepository.linguagens();
    super.initState();
    carregarDados();
  }

  void carregarDados() async{
    storage = await SharedPreferences.getInstance();

    setState(() {
      nomeController.text = storage.getString(CHAVE_NOME_CADASTRO) ?? "";
      dataNascController.text = storage.getString(CHAVE_DATA_NASCIMENTO_CADASTRO) ?? "";
      nivelSelecionado = storage.getString(CHAVE_NIVEL_CADASTRO) ?? "";
      linguagensSelecionadas = storage.getStringList(CHAVE_LINGUAGEM_CADASTRO) ?? [];
      tempoExperiencia = storage.getInt(CHAVE_TEMPO_CADASTRO) ?? 0;
      salarioEscolhido = storage.getDouble(CHAVE_SALARIO_CADASTRO) ?? 0.0;
    });
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
                onPressed: () async{
                  await storage.setString(CHAVE_NOME_CADASTRO, nomeController.text);
                  await storage.setString(CHAVE_DATA_NASCIMENTO_CADASTRO, dataNascimento.toString());
                  await storage.setString(CHAVE_NIVEL_CADASTRO, nivelSelecionado);
                  await storage.setStringList(CHAVE_LINGUAGEM_CADASTRO, linguagensSelecionadas);
                  await storage.setInt(CHAVE_TEMPO_CADASTRO, tempoExperiencia);
                  await storage.setDouble(CHAVE_SALARIO_CADASTRO, salarioEscolhido);

                  Navigator.pop(context);
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