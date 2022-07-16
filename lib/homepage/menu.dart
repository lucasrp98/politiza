import 'package:flutter/material.dart';

class menuInicial extends StatefulWidget {
  const menuInicial({Key? key}) : super(key: key);

  @override
  State<menuInicial> createState() => _menuInicialState();
}

class _menuInicialState extends State<menuInicial> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [menuPrincipal()],
    );
  }

  Widget menuPrincipal() {
    return Container(
      height: 35,
      padding: const EdgeInsets.only(left: 20, right: 0),
      child: Row(
        children: [
           const Text('Texto Padrão'),
           const Text('Texto Padrão 02'),
        ],
      ),
    );
  }
}
