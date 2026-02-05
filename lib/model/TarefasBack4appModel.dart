class TarefasBack4appModel {
  List<Tarefa> tarefas = [];

  TarefasBack4appModel(this.tarefas);

  TarefasBack4appModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <Tarefa>[];
      json['results'].forEach((v) {
        tarefas.add(Tarefa.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tarefas.map((v) => v.toJson()).toList();
      return data;
  }
}

class Tarefa {
  String objectId = "";
  String descricao = "";
  bool concluido = false;
  String createdAt = "";
  String updatedAt = "";

  Tarefa(
      this.objectId,
        this.descricao,
        this.concluido,
        this.createdAt,
        this.updatedAt);

  Tarefa.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    descricao = json['descricao'];
    concluido = json['concluido'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['descricao'] = descricao;
    data['concluido'] = concluido;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
