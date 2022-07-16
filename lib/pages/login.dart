import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:politiza/homepage/paginicial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class telaLogin extends StatefulWidget {
  const telaLogin({Key? key}) : super(key: key);

  @override
  State<telaLogin> createState() => _telaLoginState();
}

class _telaLoginState extends State<telaLogin> {
  GlobalKey<FormState> _chaveForm = GlobalKey<FormState>();
  TextEditingController _userController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
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

  final Future <SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future <void> _registroUser() async{
    final SharedPreferences prefs = await _prefs;
    prefs.setString ('usuario' , _userController.text);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _chaveForm,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              campoDeTexto(_userController, "Login"),
              Divider(),
              campoDeTexto(_senhaController, "Senha"),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: ElevatedButton(
                  child: Text( "Entrar", style: TextStyle(color: Colors.white, fontSize: 20),),
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
