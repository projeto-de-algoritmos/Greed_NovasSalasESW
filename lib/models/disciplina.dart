class Disciplina {
  String nome;
  List<int> diasSemana; // dias da semana 1 - segunda, ..., 6 - sábado
  int horarioInicio; // em minutos
  int horarioTermino; // em minutos

  Disciplina(this.nome, this.diasSemana, this.horarioInicio, this.horarioTermino);
}
