import 'package:flutter/material.dart';
import 'package:politiza/pages/atualiza.dart';
// ignore: unused_import
import 'package:politiza/pages/atualizacao.dart';
// ignore: unused_import
import 'package:politiza/pages/incidente.dart';
import 'package:politiza/pages/listaCadastros.dart';
// ignore: unused_import
import 'login.dart';
import 'abertura.dart';
// ignore: unused_import
import 'cadastro.dart';
// ignore: unused_import
import 'package:politiza/homepage/paginicial.dart';

void main() {
  runApp(MaterialApp(
    title: 'Projeto Politiza',
    theme: ThemeData(
      primarySwatch:  Colors.grey, 
      backgroundColor: Colors.black,
    ),
    home: const telaAbertura(),
  ));
}
