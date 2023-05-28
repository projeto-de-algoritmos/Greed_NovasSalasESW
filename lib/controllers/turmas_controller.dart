import '../data/lista_disciplinas.dart';
import '../models/disciplina.dart';
import '../models/sala.dart';

class TurmasController {
  List<int> diasSemana = [1, 2, 3, 4, 5, 6]; 
  List<Sala> salas = [];
  int quantidadeSalas = 0;

  void alocarTurmas() {
    // os conflitos de horário só ocorrem entre turmas que possuem ao menos um dia da semana em comum
    for(var dia in diasSemana) {
      //agrupa disciplinas que ocorrem em um mesmo dia
      List<Disciplina> disciplinasDoDia = disciplinas.where((disciplina) => disciplina.diasSemana.contains(dia)).toList();
      //ordena as disciplinas do dia em ordem crescente pelo horário de início
      disciplinasDoDia.sort((a, b) => a.horarioInicio.compareTo(b.horarioInicio));

      for(var disciplina in disciplinasDoDia) {
        bool alocada = false;

        //Interval Partitioning
        
        for(var sala in salas) {
          if(sala.disciplinas.last.horarioTermino <= disciplina.horarioInicio) {
            sala.disciplinas.add(disciplina);
            alocada = true;
            break;
          }
        }

        if(!alocada) {
          String nomeSala = "S${salas.length + 1}";
          Sala novaSala = Sala(nomeSala);
          novaSala.disciplinas.add(disciplina);
          salas.add(novaSala);
          quantidadeSalas++;
        }
      }
    }
  }
}