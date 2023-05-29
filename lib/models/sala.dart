import 'disciplina.dart';

class Sala {
  String nome;
  List<Disciplina> disciplinas;

  Sala(this.nome) : disciplinas = [];

  bool temAulaNoDia(int dia) {
    for (var disciplina in disciplinas) {
      if (disciplina.diasSemana.contains(dia)) {
        return true;
      }
    }
    return false;
  }
}