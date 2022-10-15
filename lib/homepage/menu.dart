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
        color: Colors.grey,
      ),
    );
  }

  Widget textoMenu() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Cham. Abertos",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            const Text(
              "Cham. Encerrados",
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              " 0 ",
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
            const Text(
              " 0 ",
              style: TextStyle(color: Colors.black, fontSize: 50),
            ),
          ],
        )
      ],
    );
  }
}
