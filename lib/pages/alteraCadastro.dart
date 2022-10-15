import 'package:flutter/material.dart';
import 'package:politiza/pages/cidadaoHelper.dart';
import 'package:politiza/pages/model.dart';

import 'listaCadastros.dart';

class alteraCadastro extends StatefulWidget {
  final Cidadao cidadao;
  final int indice;
  const alteraCadastro({Key? key, required this.cidadao, required this.indice})
      : super(key: key);

  @override
  State<alteraCadastro> createState() => _alteraCadastroState();
}

class _alteraCadastroState extends State<alteraCadastro> {
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _numCasaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // PersistenciaArquivoJson serviceUser = PersistenciaArquivoJson();

  @override
  void initState() {
    super.initState;
    _CidadaoTemporario = widget.cidadao;
    _nomeController.text = _CidadaoTemporario.nome;
    _senhaController.text = _CidadaoTemporario.senha;
    _enderecoController.text = _CidadaoTemporario.endereco;
    _emailController.text = _CidadaoTemporario.email;
    _cpfController.text = _CidadaoTemporario.cpf;
    _cepController.text = _CidadaoTemporario.cep;
    _bairroController.text = _CidadaoTemporario.bairro;
    // _numCasaController.text = _CidadaoTemporario.num_casa;
  }

  Cidadao _CidadaoTemporario = Cidadao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editar Cadastro de Usuário"),
      ),
      body: cardFormulario(),
    );
  }

  cardFormulario() {
    return Card(
      margin: const EdgeInsets.all(15),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              campoDados(_nomeController, "Nome", "Informe o nome completo",
                  Icons.person_add, false),
              campoDados(_emailController, "E-mail", "Ex: email@email.com",
                  Icons.alternate_email_rounded, false),
              campoDados(_senhaController, "Senha", "Informe uma senha",
                  Icons.lock_rounded, true),
              campoDados(_cpfController, "CPF", "999.999.999-99",
                  Icons.person_outline_rounded, false),
              campoDados(_cepController, "CEP", "999999-999",
                  Icons.location_city_sharp, false),
              campoDados(_enderecoController, "Endereço", "Rua A",
                  Icons.house_rounded, false),
              campoDados(_bairroController, "Bairro", "Informe uma senha",
                  Icons.horizontal_distribute_outlined, false),
              campoDados(_numCasaController, "N° Casa", "",
                  Icons.format_list_numbered, false),
              // botaoAtualizar()
            ],
          )),
    );
  }

  // botaoAtualizar() {
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 15, top: 5),
  //     child: ElevatedButton.icon(
  //       icon: Icon(Icons.add),
  //       label: Text("Atualizar"),
  //       onPressed: () {
  //         _CidadaoTemporario.nome = _nomeController.text;
  //         _CidadaoTemporario.senha = _senhaController.text;
  //         _CidadaoTemporario.endereco = _enderecoController.text;
  //         _CidadaoTemporario.email = _emailController.text;
  //         _CidadaoTemporario.cpf = _cpfController.text;
  //         _CidadaoTemporario.cep = _cepController.text;
  //         _CidadaoTemporario.bairro = _bairroController.text;
  //         cidadaoHelper().atualizar(_CidadaoTemporario);

  //         cidadaoHelper.editar(widget.indice, _CidadaoTemporario);
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (builder) => listaCadastros()));
  //       },
  //     ),
  //   );
  // }

  campoDados(TextEditingController controller, String label, String hint,
      IconData icone, bool isSenha) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: TextFormField(
        style: TextStyle(color: Colors.green[900]),
        controller: controller,
        obscureText: isSenha,
        decoration: InputDecoration(
          icon: Icon(
            icone,
            color: Colors.grey,
          ),
          hintText: hint,
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
        ),
        validator: (String? value) {
          return (value == null || value.isEmpty) ? 'Campo obrigatório' : null;
        },
      ),
    );
  }
}
