import 'package:flutter/material.dart';
import 'package:politiza/homepage/paginicial.dart';
import 'package:politiza/pages/atualizacao.dart';
import 'package:politiza/pages/incidente.dart';
import 'package:politiza/pages/listaCadastros.dart';
import 'package:politiza/pages/login.dart';

class itensMenu extends StatefulWidget {
  
  const itensMenu({Key? key})
      : super(key: key);

  @override
  State<itensMenu> createState() => _itensMenuState();
}

class _itensMenuState extends State<itensMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
      botaoMenu(Icons.add_alert_outlined, "Abrir chamado", telaAbrirChamado),
      botaoMenu(Icons.checklist_sharp, "Atualizar cadastro", telaAtualizaCadastro),
      // botaoMenu(Icons.checklist_sharp, "Listagem de usuários", telaListaCidadao),
      botaoMenu(Icons.logout, "Sair",telaSair),]
    );
  }

 telaListaCidadao(){
     Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const listaCadastros()));
  }

  telaAbrirChamado(){
     Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const telaIncidente()));
  }

  telaChamadosAbertos(){
     Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const pagInicial()));
  }

  telaAtualizaCadastro(){
     Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const telaAtualiza()));
  }

  telaSair(){
     Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const telaLogin()));
  }

  botaoMenu(IconData icon, String text, Function mudartela) {
    return Container(
      padding: EdgeInsets.all(5),
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 15),        
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          onPressed: () {
            mudartela();
          },
        ),
    );
  }
}
