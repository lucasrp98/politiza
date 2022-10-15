import 'package:flutter/material.dart';
import 'package:politiza/homepage/paginicial.dart';
import 'package:politiza/pages/alteraCadastro.dart';
import 'package:politiza/pages/cidadaoHelper.dart';
import 'package:politiza/pages/model.dart';


class listaCadastros extends StatefulWidget {
  const listaCadastros({Key? key}) : super(key: key);

  @override
  State<listaCadastros> createState() => _listaCadastrosState();
}

class _listaCadastrosState extends State<listaCadastros> {

  // PersistenciaArquivoJson paj = PersistenciaArquivoJson();
  List<Cidadao> lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(),
      body: corpo(),
    );
  }

  barraSuperior() {
    return AppBar(
      title: Text("Cidadãos Cadastrados"),
      // actions: [
      //       IconButton(
      //         icon: const Icon(Icons.logout_outlined),
      //         onPressed: () {
      //           Navigator.pop(context);
      //           Navigator.push(context, MaterialPageRoute(builder: (builder) => pagInicial()));
      //         },
      //       )
      //     ],
    );
  }

  corpo() {
    return Column(
      children: [listaCidadaos(), botaoRetorna()],
    );
  }
   botaoRetorna() {
    return Container(
      padding: const EdgeInsets.only(),
      child: ElevatedButton.icon(
        icon: Icon(Icons.login_rounded),
        label: Text(
          "Página Inicial",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: ()  {
          
          Navigator.pop(context);
          Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const pagInicial()));
        },
      ),
    );
  }

  listaCidadaos() {
    return Expanded(
        child: Card(
      margin: const EdgeInsets.all(15),
      child: FutureBuilder<List<Cidadao>>(
          future: carregarListaCidadaos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return montarListaCidadaos(snapshot.data!);
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    ));
  }

  montarListaCidadaos(List<Cidadao> Cidadaos) {
    return ListView.builder(
      itemCount: Cidadaos.length,
      itemBuilder: (context, index) {
        return itemDaLista(Cidadaos[index], index);
      },
    );
  }

  itemDaLista(Cidadao Cidadao, int indice) {
    return ListTile(
        leading: const Icon(Icons.person),
        title: Text(
          Cidadao.nome,
          style: const TextStyle(fontSize: 20),
        ),
        trailing: Wrap(children: <Widget>[
          IconButton(
            icon: const Icon(Icons.restore_from_trash, color: Colors.red),
            onPressed: () {
              setState(() {
                //paj.removerCidadao(indice);
                //remover Cidadao do banco
                cidadaoHelper().remover(lista[indice].id);
                print(indice);
              });
            },
          ),
        ]));
  }

  Future<List<Cidadao>> carregarListaCidadaos() async {
    await Future.delayed(const Duration(seconds: 2));
    lista = await cidadaoHelper().consultarTodos();
    return lista;
  }
}
