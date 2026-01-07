import 'package:flutter/material.dart';
import 'package:trilhaapp/repositories/card_detail_repository.dart';

import '../model/card_detail.dart';
import 'card_details.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: cardDetail == null ? LinearProgressIndicator() :  InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => CardDetailsPage(cardDetail: cardDetail!,)));
            },
            child: Hero(
              tag: cardDetail!.id,
              child: Card(
                elevation: 8,
                shadowColor: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(cardDetail!.url,
                          height: 30,),
                          Text(cardDetail!.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      Text(cardDetail!.text,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                      textAlign: TextAlign.justify,),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){

                        }, child: Text("Ler Mais", style: TextStyle(decoration: TextDecoration.underline),)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
