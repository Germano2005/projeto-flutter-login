import 'package:trilhaapp/model/tarefa_sql_model.dart';

import 'database_SQL.dart';

class TarefaSqlRepository {

  Future<List<TarefaSqlModel>> obterDados() async{

    List<TarefaSqlModel> tarefas = [];
     var db = await Databasesql().obterDataBase();
     var result = await db.rawQuery('SELECT id, descricao, concluido FROM tarefas');

     for(var element in result){
        tarefas.add(TarefaSqlModel(int.parse(element["id"].toString()) ,element["descricao"].toString(), element["concluido"] == 1));
     }
    return tarefas;
  }

  Future<void> salvar(TarefaSqlModel tarefaSqlModel) async{
    var db = await Databasesql().obterDataBase();

    await db.rawInsert('INSERT INTO tarefas (descricao, concluido) values(?,?)', [
      tarefaSqlModel.descricao,
      tarefaSqlModel.concluido
    ]);
  }

  Future<void> atualizar(TarefaSqlModel tarefaSqlModel) async{
    var db = await Databasesql().obterDataBase();

    await db.rawInsert('UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      tarefaSqlModel.descricao,
      tarefaSqlModel.concluido,
      tarefaSqlModel.id
    ]);
  }

  Future<void> delear(int id) async{
    var db = await Databasesql().obterDataBase();

    await db.rawInsert('DELETE FROM tarefas WHERE id = ?', [
      id
    ]);
  }


}