import 'package:flutter/material.dart';
import 'package:politiza/pages/atualizacao.dart';
import 'login.dart';
import 'abertura.dart';
import 'cadastro.dart';
import 'package:politiza/homepage/paginicial.dart';

void main() {
  runApp(MaterialApp(
    
    title: 'Projeto Politiza',
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ),
    home: pagInicial(),
  ));
}
