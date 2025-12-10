import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 200,
                  height: 200,
                  color: Colors.amber,
                  child: Icon(Icons.person, size: 100, color: Colors.blue),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.green,
                  alignment: Alignment.center,
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Informe seu Email: "),
                      Text("fulano@email.com: ")
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.green,
                  alignment: Alignment.center,
                  height: 35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Informe a senha: "),
                      Text("12345"),
                    ],
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  color: Colors.green,
                  alignment: Alignment.center,
                  height: 35,
                  child: Text("Login"),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.center,
                  height: 35,
                  child: Text("Cadastre-se"),
                ),
                SizedBox(
                  height: 20,
                )
              ],
          ),
        ),
      ),
    );
  }
}
