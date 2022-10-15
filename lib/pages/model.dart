// ignore: avoid_web_libraries_in_flutter, unused_import

// ignore: unused_import
import 'package:path_provider/path_provider.dart';

class CidadaoPropriedades {
  static String id = "id";
  static String nome = "nome";
  static String senha = "senha";
  static String email = "email";
  static String cpf = "cpf";
  static String cep = "cep";
  static String endereco = "endereco";
  static String bairro = "bairro";
  // ignore: non_constant_identifier_names
  static String num_casa = "numero";
}

class Cidadao {
  int id = 0;
  String nome = " ";
  String senha = " ";
  String email= " ";
  String cpf = " ";
  String cep = " ";
  String endereco = " ";
  String bairro = " ";
  // ignore: non_constant_identifier_names
  int num_casa = 0;

   Cidadao() {
   }

  Cidadao.fromMap(Map map) {
    id = map[CidadaoPropriedades.id] ?? 0;
    nome = map[CidadaoPropriedades.nome];
    senha = map[CidadaoPropriedades.senha];
    email = map[CidadaoPropriedades.email];
    cpf = map[CidadaoPropriedades.cpf];
    cep = map[CidadaoPropriedades.cep];
    endereco = map[CidadaoPropriedades.endereco];
    bairro = map[CidadaoPropriedades.bairro];
    num_casa = map[CidadaoPropriedades.num_casa];
  }

  Map<String, Object> toMap() {
    Map<String, Object> map = {
      CidadaoPropriedades.nome: nome,
      CidadaoPropriedades.senha: senha,
      CidadaoPropriedades.cpf: cpf,
      CidadaoPropriedades.email: email,
      CidadaoPropriedades.cep: cep,
      CidadaoPropriedades.endereco: endereco,
      CidadaoPropriedades.bairro: bairro,
      CidadaoPropriedades.num_casa: num_casa,
    };

    if(id > 0){
      map[CidadaoPropriedades.id] = id;
    }
    return map;
  }
}


