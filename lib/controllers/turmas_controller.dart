import 'package:flutter/material.dart';
import '../data/lista_disciplinas.dart';
import '../models/disciplina.dart';
import '../models/sala.dart';

class TurmasController {
  List<int> diasSemana = [1, 2, 3, 4, 5, 6]; 
  List<Sala> salas = [];
  int quantidadeSalas = 0;

  String formatarHorario(int minutos, BuildContext context) {
    final time = TimeOfDay(hour: minutos ~/ 60, minute: minutos % 60);
    return time.format(context);
  }

  void alocarTurmas() {
    for (var dia in diasSemana) {
      List<Disciplina> disciplinasDoDia = disciplinas.where((disciplina) => disciplina.diasSemana.contains(dia)).toList();

      disciplinasDoDia.sort((a, b) => a.horarioInicio.compareTo(b.horarioInicio));

      for (var disciplina in disciplinasDoDia) {
        bool alocada = false;

        for (var sala in salas) {
          bool horariosDisponiveis = true;

          for (var outraDisciplina in sala.disciplinas) {
            if (outraDisciplina.diasSemana.any((dia) => disciplina.diasSemana.contains(dia)) &&
                (outraDisciplina.horarioInicio >= disciplina.horarioInicio &&
                    outraDisciplina.horarioInicio < disciplina.horarioTermino ||
                    outraDisciplina.horarioTermino > disciplina.horarioInicio &&
                        outraDisciplina.horarioTermino <= disciplina.horarioTermino)) {
              horariosDisponiveis = false;
              break;
            }
          }

          if (horariosDisponiveis) {
            sala.disciplinas.add(disciplina);
            alocada = true;
            break;
          }
        }

        if (!alocada) {
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