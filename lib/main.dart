import 'package:flutter/material.dart';
import '../data/lista_disciplinas.dart'; 
import '../views/tela_disciplinas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaDisciplinas(disciplinas), 
    );
  }
}

