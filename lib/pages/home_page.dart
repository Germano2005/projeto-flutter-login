import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/card_page.dart';
import 'package:trilhaapp/pages/image_assets.dart';
import 'package:trilhaapp/pages/list_view_h.dart';
import 'package:trilhaapp/pages/list_view_v.dart';
import 'package:trilhaapp/pages/tarefa_page.dart';
import 'package:trilhaapp/pages/consulta_cep.dart';
import 'package:trilhaapp/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Índice da página atual
  int _currentPageIndex = 0;

  // Lista de páginas que serão exibidas
  final List<Widget> _pages = [
    CardPage(),
    ImageAssetsPage(),
    ListViewV(),
    ListViewH(),
    TarefaPage(),
    ConsultaCep(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meu App"),
        ),
        drawer: CustomDrawer(),
        body: _pages[_currentPageIndex], // Exibe a página atual
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex, // Índice da página atual
          onTap: (index) {
            // Atualiza o estado quando um item é selecionado
            setState(() {
              _currentPageIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Página 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Página 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monitor),
              label: 'Página 3',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monitor),
              label: 'Página 4',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.work),
              label: 'Tarefas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.http),
              label: 'HTTP',
            ),
          ],
        ),
      ),
    );
  }
}