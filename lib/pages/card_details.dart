import 'package:flutter/material.dart';
import 'package:trilhaapp/model/card_detail.dart';

class CardDetailsPage extends StatelessWidget {

  final CardDetail cardDetail;

  const CardDetailsPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close)),
                Row(
                  children: [
                    Image.network(cardDetail.url,
                      height: 100,),
                  ],
                ),
                Text(cardDetail.title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w600),),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Text(cardDetail.text,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                    textAlign: TextAlign.justify,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
