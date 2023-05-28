import 'package:flutter/material.dart';
import '../controllers/turmas_controller.dart';
import '../models/sala.dart';

class TelaSalas extends StatefulWidget {
  final List<Sala> salas;

  const TelaSalas(this.salas, {Key? key}) : super(key: key);

  @override
  State<TelaSalas> createState() => _TelaSalasState();
}

class _TelaSalasState extends State<TelaSalas> {
  TurmasController turmasController = TurmasController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salas'),
      ),
      body: ListView.builder(
        itemCount: widget.salas.length,
        itemBuilder: (context, index) {
          final sala = widget.salas[index];
          return ListTile(
            title: Text(sala.nome),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: sala.disciplinas
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
        },
      ),
    );
  }
}