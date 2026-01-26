class TarefaSqlModel {
  int _id = 0;
  String _descricao = "";
  bool _concluido = false;


  TarefaSqlModel(this._id, this._descricao, this._concluido);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get descricao => _descricao;

  bool get concluido => _concluido;

  set concluido(bool value) {
    _concluido = value;
  }

  set descricao(String value) {
    _descricao = value;
  }
}