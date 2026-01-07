import 'package:flutter/material.dart';

class ListViewH extends StatefulWidget {
  const ListViewH({super.key});

  @override
  State<ListViewH> createState() => _ListViewHState();
}

class _ListViewHState extends State<ListViewH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Card(
                      child: Image.asset("lib/images/RCF_8383.JPG")
                  ),
                  Card(
                      child: Image.asset("lib/images/163420182.png")
                  ),
                  Card(
                      child: Image.asset("lib/images/IMG_1855.JPG")
                  ),
                ],
              ),
          ),
          Expanded(
            flex: 3,
              child: Container(

          ))
        ],
      ),
    );
  }
}
