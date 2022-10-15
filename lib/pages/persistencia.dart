import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:politiza/pages/model.dart';

class PersistenciaArquivoJson2{
  Future<File> _getFile() async {
      final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/politiza.json");
  }

    Future gravarCidadao(Cidadao cidadao) async {
    List<Cidadao> listaCidadaos = await lerCidadaos();
    listaCidadaos.add(cidadao);

    await gravarCidadaos(listaCidadaos);
  }

  Future <List<Cidadao>> lerCidadaos() async {

    List<Cidadao> listaCidadaoNoArquivo = [];

    String listaComoString = " ";
    try{
        final arquivo = await _getFile();
        listaComoString = await arquivo.readAsString();
    } catch (e){
        // ignore: avoid_print
        print("Erro na leitura do arquivo $e");
    }
    List mapCidadaos = [];
    if (listaComoString.isNotEmpty){
        mapCidadaos = json.decode(listaComoString);
    }
    
    for (Map cadadaoMap in mapCidadaos){
        listaCidadaoNoArquivo.add(Cidadao.fromMap(cadadaoMap));
    }
      return listaCidadaoNoArquivo;
  }


  Future gravarCidadaos(List<Cidadao> cidadaos) async {
    List mapCidadaos = [];
    for (Cidadao cidadao in cidadaos) {
      mapCidadaos.add(cidadao.toMap());
    }

    String listaComoString = json.encode(mapCidadaos);
    final arquivo = await _getFile();

    await arquivo.writeAsString(listaComoString);
  }

    Future removerCidadao(int indice) async {
    List<Cidadao> listaCidadaos = await lerCidadaos();

    listaCidadaos.removeAt(indice);

    await gravarCidadaos(listaCidadaos);
  }

// parte do trabalho que tenho de fazer (editar o arquivo)

    Future editaCidadao(int indice, Cidadao cidadao) async {
      
    List<Cidadao> listaCidadaos = await lerCidadaos();

    listaCidadaos [indice] = cidadao;
    
    await gravarCidadaos(listaCidadaos);
  }
  
}

