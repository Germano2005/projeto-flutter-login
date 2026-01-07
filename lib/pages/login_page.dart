import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/home_page.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  var latitudeController = TextEditingController();
  var longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text("MAPA DE RUIDO", style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 150,
                  height: 150,
                  child: Icon(Icons.camera_alt_outlined),
                ),
                Text("Acessar Camera", style: TextStyle(fontSize: 30),),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.topLeft,
                  height: 35,
                    child: TextField(
                      controller: latitudeController,
                      decoration: InputDecoration(
                        hintText: "Latitude",
                          prefixIcon: Icon(Icons.location_on_sharp, color: Colors.blueAccent,)
                      ),
                    )
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 35,
                    child: TextField(
                      controller: longitudeController,
                      decoration: InputDecoration(
                          hintText: "Longitude",
                          prefixIcon: Icon(Icons.location_on_sharp, color: Colors.blueAccent,)
                      ),
                    )
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  alignment: Alignment.center,
                  height: 35,
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        onPressed: ()
                    {
                      debugPrint(latitudeController.text);
                      debugPrint(longitudeController.text);

                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
                    },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(5)
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blueAccent
                        ),
                        child: Text("CADASTRAR DISPOSITIVO", style: TextStyle(fontWeight: FontWeight.w700), selectionColor: Colors.black,)),
                  ),
                ),
              ],
          ),
        ),
      ),
    );
  }
}
