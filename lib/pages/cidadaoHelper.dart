import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:politiza/pages/cadastro.dart';
import 'package:politiza/pages/model.dart';

class cidadaoHelper {
  static final cidadaoHelper _instance = cidadaoHelper._interno();

  factory cidadaoHelper() => _instance;

  cidadaoHelper._interno();

  Database? _banco;

  Future<Database> get banco async {
    if (_banco != null) {
      return _banco!;
    } else {
      _banco = await iniciarBanco();
      return _banco!;
    }
  }

  String tabelaCidadao = "cidadao";

  Future<Database> iniciarBanco() async {
    final caminhoDoBanco = await getDatabasesPath();

    final caminho = join(caminhoDoBanco, "cidadaos.db");

    const versao = 3;

    String sqlCriarBanco = "CREATE TABLE $tabelaCidadao("
        "${CidadaoPropriedades.id} INTEGER PRIMARY KEY ,"
        "${CidadaoPropriedades.nome} TEXT,"
        "${CidadaoPropriedades.senha} TEXT,"
        "${CidadaoPropriedades.email} TEXT,"
        "${CidadaoPropriedades.cpf} TEXT,"
        "${CidadaoPropriedades.cep} TEXT,"
        "${CidadaoPropriedades.endereco} TEXT,"
        "${CidadaoPropriedades.bairro} TEXT,"
        "${CidadaoPropriedades.num_casa} INTEGER"
        ")";

    String destruirBanco = "DROP TABLE $tabelaCidadao";

    return openDatabase(
      caminho,
      version: versao,
      onCreate: (banco, versaoNova) async {
        print("Criando banco com versao $versaoNova");
        await banco.execute(sqlCriarBanco);
      },
      onUpgrade: (banco, versaoAntiga, versaoNova) async {
        print("Atualizando banco da versão $versaoAntiga" "para a $versaoNova");
        await banco.execute(destruirBanco);
        await banco.execute(sqlCriarBanco);
      },
    );
  }

  Future<Cidadao> salvar(Cidadao cidadao) async {
    Database bancoCidadao = await banco;
    cidadao.id = await bancoCidadao.insert(tabelaCidadao, cidadao.toMap());
    return cidadao;
  }

  Future<Cidadao> consultar(int id) async {
    Database bancoCidadao = await banco;
    List<Map> retorno = await bancoCidadao.query(tabelaCidadao,
        columns: [
          CidadaoPropriedades.id,
          CidadaoPropriedades.nome,
          CidadaoPropriedades.senha,
          CidadaoPropriedades.email,
          CidadaoPropriedades.cpf,
          CidadaoPropriedades.endereco,
          CidadaoPropriedades.bairro,
          CidadaoPropriedades.num_casa,
        ],
        where: "${CidadaoPropriedades.id} = ?",
        whereArgs: [id]);

    if (retorno.isNotEmpty) {
      return Cidadao.fromMap(retorno.first);
    } else {
      return null!;
    }
  }

  Future<List<Cidadao>> consultarTodos() async {
    Database bancoCidadao = await banco;
    List<Map> retorno =
        await bancoCidadao.rawQuery("SELECT * FROM $tabelaCidadao");
    List<Cidadao> cidadaos = [];
    for (Map cidadao in retorno) {
      cidadaos.add(Cidadao.fromMap(cidadao));
    }
    return cidadaos;
  }

  Future<int> atualizar(Cidadao cidadao) async {
    Database bancoCidadao = await banco;
    return await bancoCidadao.update(tabelaCidadao, cidadao.toMap(),
        where: "${CidadaoPropriedades.id} = ?", whereArgs: [cidadao.id]);
  }

  Future<int> remover(int id) async {
    Database bancoCidadao = await banco;
    return await bancoCidadao.delete(tabelaCidadao,
        where: "${CidadaoPropriedades.id} = ?", whereArgs: [id]);
  }

  Future<int?> quantidade() async {
    Database bancoCidadao = await banco;
    return Sqflite.firstIntValue(
        await bancoCidadao.rawQuery("SELECT COUNT (*) FROM $tabelaCidadao"));
  }

  Future<Cidadao> login(String nome, String senha) async {
    Database bancoCidadao = await banco;
    List<Map> retorno = await bancoCidadao.query(tabelaCidadao,
        where: "${CidadaoPropriedades.nome} = ?"
            " AND "
            "${CidadaoPropriedades.senha} = ?"
            ,
        whereArgs: [nome, senha]);
    if (retorno.isNotEmpty) {
      return Cidadao.fromMap(retorno.first);
    } else {
      return Cidadao();
    }
  }
}
