import 'package:flutter/material.dart';
import '../controllers/turmas_controller.dart';
import '../models/disciplina.dart';
import '../models/sala.dart';
import '../widgets/filtro_dia.dart';

class TelaSalas extends StatefulWidget {
  final List<Sala> salas;

  const TelaSalas(this.salas, {Key? key}) : super(key: key);

  @override
  State<TelaSalas> createState() => _TelaSalasState();
}

class _TelaSalasState extends State<TelaSalas> {
  TurmasController turmasController = TurmasController();
  int? diaSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salas'),
      ),
      body: Column(
        children: [
          FiltroDias(
            diasSemana: const [1, 2, 3, 4, 5, 6],
            diaSelecionado: diaSelecionado,
            aoSelecionar: (dia) {
              setState(() {
                diaSelecionado = dia;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.salas.length,
              itemBuilder: (context, index) {
                final sala = widget.salas[index];
                if(diaSelecionado == null || sala.temAulaNoDia(diaSelecionado!)) {
                   List<Disciplina> turmasDoDia = diaSelecionado != null ? 
                    sala.disciplinas.where((disciplina) => disciplina.diasSemana.contains(diaSelecionado)).toList() 
                    : sala.disciplinas;
                  return ListTile(
                    title: Text(sala.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: turmasDoDia
                          .map(
                            (disciplina) => Column(
                              children: [
                                Text(
                                  '${disciplina.nome}: ${turmasController.formatarHorario(disciplina.horarioInicio, context)} - ${turmasController.formatarHorario(disciplina.horarioTermino, context)}',
                                ),
                                const SizedBox(height: 10),
                              ]
                            ),
                          )
                          .toList(),
                    ),
                  );
                }
                else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}