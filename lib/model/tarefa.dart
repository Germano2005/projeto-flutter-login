
import 'package:flutter/cupertino.dart';

class Tarefa {
  final String _id = UniqueKey().toString();
  String _descricao = "";
  bool _conluido = false;

  Tarefa(this._descricao, this._conluido);
  
  String get id => _id;

  bool get conluido => _conluido;

  String get descricao => _descricao;

  set conluido(bool value) {
    _conluido = value;
  }

  set descricao(String value) {
    _descricao = value;
  }
}