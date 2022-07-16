import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:politiza/pages/login.dart';
import 'package:politiza/homepage/paginicial.dart';

class telaCadastrado extends StatefulWidget {
  const telaCadastrado({Key? key}) : super(key: key);

  @override
  State<telaCadastrado> createState() => _telaCadastradoState();
}

class _telaCadastradoState extends State<telaCadastrado> {
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _enderecoController = TextEditingController();
  String _bairroSelecionado = "Centro";

  @override
  campoDeTexto(TextEditingController controller, String label, TextInputType tipo, bool senha) {
    return TextFormField(
      controller: controller,
      autofocus: true,
      keyboardType: tipo,
      obscureText: senha,
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

  criaDropDownButton() {
    var _valores = ['Centro', 'Vila Nova', 'Ouro Verde'];
    return DropdownButton<String>(
      value: _bairroSelecionado,
      items: _valores.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (valor) {
        setState(() {
          _bairroSelecionado = valor!;
        });
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
              campoDeTexto(_nomeController, "Nome", TextInputType.name, false),
              Divider(),
              campoDeTexto(_senhaController, "Senha", TextInputType.text, true),
              Divider(),
              campoDeTexto(_cpfController, "CPF", TextInputType.number, false),
              Divider(),
              campoDeTexto(_enderecoController, "Endereço", TextInputType.text, false),
              Divider(),
              Text("Bairro", style: TextStyle(color: Colors.purple, fontSize: 20),),
              criaDropDownButton(),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  child: Text(
                    "Entrar",
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
                                builder: (builder) => telaLogin()))
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
