import 'package:flutter/material.dart';

class FiltroDias extends StatelessWidget {
  final List<int> diasSemana;
  final int? diaSelecionado;
  final Function(int?) aoSelecionar;

  const FiltroDias({super.key, 
    required this.diasSemana,
    required this.diaSelecionado,
    required this.aoSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Filtrar por dia:'),
        const SizedBox(width: 10),
        DropdownButton<int>(
          value: diaSelecionado,
          onChanged: aoSelecionar,
          items: [
            const DropdownMenuItem<int>(
              value: null,
              child: Text('todos'),
            ),
            for (int dia in diasSemana)
              DropdownMenuItem<int>(
                value: dia,
                child: Text(_getDiaSemanaLabel(dia)),
              ),
          ],
        ),
      ],
    );
  }

  String _getDiaSemanaLabel(int diaSemana) {
    switch (diaSemana) {
      case 1:
        return 'segunda-feira';
      case 2:
        return 'terça-feira';
      case 3:
        return 'quarta-feira';
      case 4:
        return 'quinta-feira';
      case 5:
        return 'sexta-feira';
      case 6:
        return 'sábado';
      default:
        return '';
    }
  }
}