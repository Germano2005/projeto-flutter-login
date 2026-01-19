import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/num_alet_page.dart';
import 'package:trilhaapp/pages/posts_page.dart';

import '../pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
                showModalBottomSheet(context: context, builder: (BuildContext bc){
                  return Wrap(children: [
                    ListTile(
                      title: Text("Camera"),
                      leading: Icon(Icons.camera_alt_outlined),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text("Galeria"),
                      leading: Icon(Icons.photo_album),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],);
                });
            },
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent
              ),
              currentAccountPicture: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                  child: Image.network("https://static.vecteezy.com/system/resources/thumbnails/027/971/384/small/3d-render-blue-fire-flame-icon-realistic-oxygen-gas-with-sparks-light-flare-symbol-design-for-emoticon-energy-ui-design-png.png")),
                accountName: Text("Germano Coelho"),
                accountEmail: Text("email@email.com")
            ),
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.home),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Home"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MeusDados(
                )),
              );
            },
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.list),
                  SizedBox(
                    width: 10,
                  ),
                  Text("List"),
                ],
              ),
            ),
            onTap: () {
              showModalBottomSheet(context: context, builder: (BuildContext bc){
                return Container(child: Text("Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se a mobilidade dos capitais internacionais estimula a padronização do levantamento das variáveis envolvidas.",
                  style: TextStyle(fontSize: 12),),);
              });
            },
          ),
          Divider(),
          SizedBox(
            height: 20,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.monitor),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Monitoring"),
                ],
              ),
            ),
            onTap: () {},
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.post_add),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Posts"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (bc) => PostsPage()));
            },
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.numbers),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Numeros"),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (bc) => NumAletPage()));
            },
          ),
          Divider(),
          SizedBox(
            height: 10,
          ),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Exit"),
                ],
              ),
            ),
            onTap: () {
              showDialog(context: context, builder: (BuildContext bc){
                return AlertDialog(
                  title: Text("Meu app"),
                  content: Wrap(
                    children: [
                      Text("Deseja sair do app?"),
                    ],
                  ),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Não")),
                    TextButton(onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginPage()));
                    }, child: Text("Sim")),

                  ],
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
