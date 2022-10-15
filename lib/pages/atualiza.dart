import 'package:flutter/material.dart';
import 'package:politiza/pages/login.dart';
import 'package:politiza/pages/model.dart';
import 'package:politiza/pages/persistencia.dart';

class editaCidadao extends StatefulWidget {
  final Cidadao cidadao;
  final int index;
  editaCidadao({Key? key, required this.cidadao, this.index = 0}) : super(key: key);

  @override
  State<editaCidadao> createState() => _editaCidadaoState();
}

class _editaCidadaoState extends State<editaCidadao> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  // PersistenciaArquivoJson paj = PersistenciaArquivoJson();

  @override
  void initState() {
    super.initState;
    final _usuarioTemporario = widget.cidadao;
    _usuarioController.text = _usuarioTemporario.nome;
    _senhaController.text = _usuarioTemporario.senha;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuperior(),
      body: corpo(),
    );
  }

  barraSuperior() {
    return AppBar(
      title: Text("Editar Usuario"),
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
              campoDados(_usuarioController, "Usuário",
                  "Informe o nome de usuário", Icons.person_add, false),
              campoDados(_senhaController, "Senha", "Informe uma senha",
                  Icons.key, false),
              botaoAtualizar()
            ],
          )),
    );
  }

  botaoAtualizar() {
    return Padding(
      padding: const EdgeInsets.only(right: 15, top: 5),
      child: ElevatedButton.icon(
        icon: Icon(Icons.add),
        label: Text("Atualizar"),
        onPressed: () {
          Cidadao cidadao = Cidadao();

          cidadao.nome = _usuarioController.text;
          cidadao.senha = _senhaController.text;
         
          // paj.editaCidadao(widget.index, cidadao);
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => telaLogin()));
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
        // initialValue: defaultText,
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
