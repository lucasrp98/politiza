import 'package:flutter/material.dart';

class telaCabecalho extends StatefulWidget {
  const telaCabecalho({ Key? key }) : super(key: key);

  @override
  State<telaCabecalho> createState() => _telaCabecalhoState();
}

class _telaCabecalhoState extends State<telaCabecalho> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [imagemCabecalho(), textoCabecalho()],
    );
  }

  Widget textoCabecalho(){
    return Text("Prefeitura Municipal de Camaquã");
  }

  Widget imagemCabecalho(){
    return GestureDetector(
      child:  Image.network(
        "https://www.camaquar.instarbr.com.br/imgeditor/brasao.jpg",
        width: 20,
      ),
    );
  } 
}