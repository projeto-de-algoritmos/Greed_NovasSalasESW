import 'package:flutter/material.dart';
import '../models/disciplina.dart';

class TelaDisciplinas extends StatefulWidget {
  final List<Disciplina> disciplinas;

  const TelaDisciplinas(this.disciplinas, {Key? key}) : super(key: key);

  @override
    TelaDisciplinasState createState() => TelaDisciplinasState();
}

class TelaDisciplinasState extends State<TelaDisciplinas> {
  int? diaSelecionado;

  String formatarHorario(int minutos) {
    final time = TimeOfDay(hour: minutos ~/ 60, minute: minutos % 60);
    return time.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Turmas')),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('Filtrar por dias:'),
              const SizedBox(width: 10),
              DropdownButton<int>(
                value: diaSelecionado,
                onChanged: (value) {
                  setState(() {
                    diaSelecionado = value;
                  });
                },
              items: const [
                DropdownMenuItem<int>(
                  value: null,
                  child: Text('Todos'),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('segunda-feira'),
                ),
                DropdownMenuItem<int>(
                  value: 2,
                  child: Text('terça-feira'),
                ),
                DropdownMenuItem<int>(
                  value: 3,
                  child: Text('quarta-feira'),
                ),
                DropdownMenuItem<int>(
                  value: 4,
                  child: Text('quinta-feira'),
                ),
                DropdownMenuItem<int>(
                  value: 5,
                  child: Text('sexta-feira'),
                ),
                DropdownMenuItem<int>(
                  value: 6,
                  child: Text('sábado'),
                ),
              ],
            ),
          ],
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
                      'Horário: ${formatarHorario(disciplina.horarioInicio)} - ${formatarHorario(disciplina.horarioTermino)}',
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