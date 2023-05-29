import 'package:flutter/material.dart';
import '../controllers/turmas_controller.dart';
import '../models/disciplina.dart';
import '../widgets/filtro_dia.dart';
import 'tela_salas.dart';

class TelaDisciplinas extends StatefulWidget {
  final List<Disciplina> disciplinas;

  const TelaDisciplinas(this.disciplinas, {Key? key}) : super(key: key);

  @override
    State<TelaDisciplinas> createState() => _TelaDisciplinasState();
}

class _TelaDisciplinasState extends State<TelaDisciplinas> {
  int? diaSelecionado;
  TurmasController turmasController = TurmasController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turmas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              turmasController.alocarTurmas();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaSalas(turmasController.salas),
                ),
              );
            },
          ),
        ],
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
              itemCount: widget.disciplinas.length,
              itemBuilder: (context, index) {
                final disciplina = widget.disciplinas[index];
                if(diaSelecionado == null || disciplina.diasSemana.contains(diaSelecionado)) {
                  return ListTile(
                    title: Text(disciplina.nome),
                    subtitle: Text(
                      'Horário: ${turmasController.formatarHorario(disciplina.horarioInicio, context)} - ${turmasController.formatarHorario(disciplina.horarioTermino, context)}',
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