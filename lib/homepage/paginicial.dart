import 'package:flutter/material.dart';
import 'package:politiza/homepage/cabecalho.dart';
import 'package:politiza/homepage/itens.dart';
import 'package:politiza/homepage/menu.dart';

class pagInicial extends StatefulWidget {
  const pagInicial({Key? key}) : super(key: key);

  @override
  State<pagInicial> createState() => _pagInicialState();
}

class _pagInicialState extends State<pagInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Página Inicial"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          telaCabecalho(),
          menuInicial(),
          Container(
            child: Column(children: [
              itensMenu(),
            ],),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
