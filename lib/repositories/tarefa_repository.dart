
import 'package:trilhaapp/model/tarefa.dart';

class TarefaRepository {

  final List<Tarefa> _tarefas = [];

  Future<void> adicionar(Tarefa tarefa) async{
    await Future.delayed(Duration(milliseconds: 0));
    _tarefas.add(tarefa);
  }

  Future<void> alterar(String id, bool concluido) async{
    await Future.delayed(Duration(milliseconds: 0));
    _tarefas.where((tarefa) => tarefa.id == id).first.conluido = concluido;
  }

  Future<void> remover(String id) async{
    await Future.delayed(Duration(milliseconds: 0));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.id == id).first);

  }

  Future<List<Tarefa>> listarTarefas() async{
    await Future.delayed(Duration(milliseconds: 0));
    return _tarefas;
  }

  Future<List<Tarefa>> listarTarefasNaoConcluidas() async{
    await Future.delayed(Duration(milliseconds: 0));
    return _tarefas.where((tarefa) => !tarefa.conluido).toList();
  }
}