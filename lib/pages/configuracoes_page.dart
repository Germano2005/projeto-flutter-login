import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {

  late SharedPreferences storage;
  
  var nomeUsuarioController = TextEditingController();
  var alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberNotificacao = false;
  bool temaEscuro = false;

  final CHAVE_NOME_USUARIO = "nome_usuario";
  final CHAVE_ALTURA = "altura_usuario";
  final CHAVE_RECEBER_NOTIFICACAO = "receber_notificacao";
  final CHAVE_TEMA_ESCURO = "tema_escuro";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();

  }

  void carregarDados() async{
    storage = await SharedPreferences.getInstance();
    setState(() {
      nomeUsuarioController.text = storage.getString(CHAVE_NOME_USUARIO) ?? "";
      alturaController.text = (storage.getDouble(CHAVE_ALTURA) ?? 0).toString();
      receberNotificacao = storage.getBool(CHAVE_RECEBER_NOTIFICACAO) ?? false;
      temaEscuro = storage.getBool(CHAVE_TEMA_ESCURO) ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Configurações"),
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
          ),
          body: Container(
            width: double.infinity,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Nome usuário"
                    ),
                    controller: nomeUsuarioController,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Altura"
                    ),
                    controller: alturaController,
                  ),
                ),
                SwitchListTile(
                  title: Text("Receber notificações"),
                    value: receberNotificacao, 
                    onChanged: (bool value){
                  setState(() {
                    receberNotificacao = value;
                  });
                }),
                SwitchListTile(
                  title: Text("Tema Escuro"),
                    value: temaEscuro, 
                    onChanged: (bool value){
                  setState(() {
                    temaEscuro = value;
                  });
                }),
                SizedBox(
                  height: 30,
                ),
                TextButton(
                    onPressed: () async{
                        try{
                          await storage.setDouble(CHAVE_ALTURA, double.parse(alturaController.text));
                        }
                        catch(e){
                          showDialog(context: context, builder: (_) {
                            return AlertDialog(
                              title: Text("Meu App"),
                              content: Text("Favor informar uma altura válida!"),
                              actions: [
                                TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK"))
                              ],
                            );
                          });
                          return;
                        }
                        await storage.setString(CHAVE_NOME_USUARIO, nomeUsuarioController.text);
                        await storage.setBool(CHAVE_RECEBER_NOTIFICACAO, receberNotificacao);
                        await storage.setBool(CHAVE_TEMA_ESCURO, temaEscuro);
                        Navigator.pop(context);
                    },
                    child: Text("Salvar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),))
              ],
            ),
          ),
        )
    );
  }
}
