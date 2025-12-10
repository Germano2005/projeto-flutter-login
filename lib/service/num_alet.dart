import 'dart:math';

class GeradorNumAlet{

  static int gerarUmNumeroAle(int max){
    Random numeroGerado = Random();

    return numeroGerado.nextInt(max);
  }
}