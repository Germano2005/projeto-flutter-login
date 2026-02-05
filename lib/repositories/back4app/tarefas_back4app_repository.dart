import 'package:dio/dio.dart';
import 'package:trilhaapp/model/TarefasBack4appModel.dart';

class TarefasBack4appRepository {


  Future<TarefasBack4appModel> obterTarefas() async{

    var dio  = Dio();

    var result = await dio.get("https://parseapi.back4app.com/classes/Tarefas");

    return TarefasBack4appModel.fromJson(result.data);

  }


}