import 'package:dio/dio.dart';
import 'package:trilhaapp/model/tarefas_back4app_model.dart';



class TarefasBack4appRepository {

  var _dio = Dio();

  TarefasBack4appRepository(){

    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] = "M0m9QZyuqFt5mv4TzD6o7pRZqLhG0Fc8h47hXkfW";
    _dio.options.headers["X-Parse-REST-API-Key"] = "JyphxYFImKy9XqnglLTN1urSTWCe68gt7OGF0opI";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }


  Future<TarefasBack4appModel> obterTarefas(bool naoConcluidas) async{
    var url = "/Tarefas";

    if(naoConcluidas){
      url = "$url?where={\"concluido\": true}";
    }

    var result = await _dio.get(url);

    return TarefasBack4appModel.fromJson(result.data);

  }

  Future<void> criar(Tarefa tarefa) async{
    try{
      await _dio.post("/Tarefas", data: tarefa.toCreateJson());
    }catch(e){
      throw e;

    }

  }

  Future<void> atualizar(Tarefa tarefa) async{
    try{
      await _dio.put("/Tarefas/${tarefa.objectId}", data: tarefa.toCreateJson());
    }catch(e){
      throw e;

    }

  }

  Future<void> remover(String objectId) async{
    try{
      await _dio.delete("/Tarefas/$objectId");
    }catch(e){
      throw e;

    }

  }


}