import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:politiza/pages/persistencia.dart';
import 'package:politiza/pages/model.dart';
import 'package:flutter/material.dart';
import 'package:politiza/homepage/cabecalho.dart';
import 'package:politiza/pages/login.dart';
import 'package:politiza/homepage/paginicial.dart';
import 'package:politiza/pages/cidadaoHelper.dart';

class telaCadastrado extends StatefulWidget {
  const telaCadastrado({Key? key}) : super(key: key);

  @override
  State<telaCadastrado> createState() => _telaCadastradoState();
}

class _telaCadastradoState extends State<telaCadastrado> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _cepController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  TextEditingController _numCasaController = TextEditingController();

   cidadaoHelper banco = cidadaoHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [telaCabecalho(), corpo()],
      )),
    );
  }

  barraSuperior() {
    return AppBar(
      title: Text("Cadastro"),
    );
  }

  corpo() {
    return Column(
      children: [cardFormulario()],
    );
  }

  cardFormulario() {
    return Card(
      margin: EdgeInsets.all(15),
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
              campoDados(
                  _cepController, "CEP", "999999-999", Icons.location_city_sharp, false),
              campoDados(_enderecoController, "Endereço", "Rua A",
                  Icons.house_rounded, false),
              campoDados(_bairroController, "Bairro", "Informe uma senha",
                  Icons.horizontal_distribute_outlined, false),
              campoDados(_numCasaController, "N° Casa", "",
                  Icons.format_list_numbered, false),
              botaoRegistro(),
            ],
          )),
    );
  }

  botaoRegistro() {
    return Container(
      padding: const EdgeInsets.only(),
      child: ElevatedButton.icon(
        icon: Icon(Icons.login_rounded),
        label: Text(
          "Registrar-se",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        onPressed: ()  {
          
           Cidadao cidadao = Cidadao();

          cidadao.nome = _nomeController.text;
          cidadao.senha = _senhaController.text;
          cidadao.email = _emailController.text;
          cidadao.cpf = _cpfController.text;
          cidadao.cep = _cepController.text;
          cidadao.endereco = _enderecoController.text;
          cidadao.bairro = _bairroController.text;
          cidadao.num_casa = int.parse(_numCasaController.text);

          banco.salvar(cidadao);
          
          setState(() {
            _nomeController.clear();
            _senhaController.clear();
            _emailController.clear();
            _cpfController.clear();
            _cepController.clear();
            _enderecoController.clear();
            _bairroController.clear();
            _numCasaController.clear();

          });

          Navigator.pop(context);
          Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const telaLogin()));
        },
      ),
    );
  }

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
