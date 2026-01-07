import 'package:flutter/material.dart';

class ListViewV extends StatefulWidget {
  const ListViewV({super.key});

  @override
  State<ListViewV> createState() => _ListViewVState();
}

class _ListViewVState extends State<ListViewV> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset("lib/images/163420182.png"),
          title: Text("Foto de formatura"),
          trailing: PopupMenuButton<String>(
            onSelected: (menu){

            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(value: "Opção1", child: Text("Opção1"),),
                PopupMenuItem<String>(value: "Opção2", child: Text("Opção2"),),
                PopupMenuItem<String>(value: "Opção3", child: Text("Opção3"),),
              ];
            },
          ),
        ),
        Image.asset("lib/images/RCF_8383.JPG"),
        Image.asset("lib/images/163420182.png"),
        Image.asset("lib/images/IMG_1855.JPG"),
      ],
    );
  }
}
