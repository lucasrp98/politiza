import 'package:flutter/material.dart';

class menuInicial extends StatefulWidget {
  const menuInicial({Key? key}) : super(key: key);

  @override
  State<menuInicial> createState() => _menuInicialState();
}

class _menuInicialState extends State<menuInicial> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [menuPrincipal(), textoMenu()],
    );
  }

  Widget menuPrincipal() {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color.fromRGBO(35, 60, 103, 1),
      ),
    );
  }

  Widget textoMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Texto Padrão',
        ),
        const Text(
          'Texto Padrão 02',
        ),
      ],
    ); //   }
  }
}
