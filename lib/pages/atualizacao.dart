import 'package:flutter/material.dart';
import 'package:politiza/homepage/paginicial.dart';

class telaAtualizacao 
extends StatefulWidget {
  const telaAtualizacao({ Key? key }) : super(key: key);
  @override
  State<telaAtualizacao> createState() => _telaAtualizacaoState();
}


class _telaAtualizacaoState extends State<telaAtualizacao> {
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  TextEditingController _bairroController = TextEditingController();
  @override
  
  campoDeTexto(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      style: new TextStyle(color: Colors.purple, fontSize: 20),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.purple, fontSize: 20),
      ),
      validator: (texto) {
        if (texto!.isEmpty) {
          return "Campo obrigatório!";
        }
      },
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _chaveForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              campoDeTexto(_nomeController, "Nome"),
              Divider(),
              campoDeTexto(_senhaController, "Senha"),
              Divider(),
              campoDeTexto(_cpfController, "CPF"),
              Divider(),
              campoDeTexto(_enderecoController, "Endereço"),
              Divider(),
              campoDeTexto(_bairroController, "Bairro"),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  child: Text(
                    "Atualizar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => {
                    if (_chaveForm.currentState!.validate())
                      {
                        print("Campo obrigatorio"),
                        Navigator.pop(context),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => pagInicial()))
                      }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}