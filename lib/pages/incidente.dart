import 'package:flutter/material.dart';
import 'package:politiza/homepage/cabecalho.dart';
import 'package:politiza/homepage/paginicial.dart';

class telaIncidente extends StatefulWidget {
  const telaIncidente({Key? key}) : super(key: key);

  @override
  State<telaIncidente> createState() => _telaIncidenteState();
}

class _telaIncidenteState extends State<telaIncidente> {
  String _incidenteSelecionado = "Água e esgoto";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Registra Incidente"),
        ),
        body: Column(
          children: [
            const Divider(),
            telaCabecalho(),
            const Divider(),
            incidenteDropDownButton(),
            const Divider(),
            textoIncidente(),
            const Divider(),
            botaoRegistra()
          ],
        ));
  }

  incidenteDropDownButton() {
    var _valores = [
      'Água e esgoto',
      'Estab. irregular',
      'Ilumunição e Energia'
    ];

    return DropdownButton<String>(
      value: _incidenteSelecionado,
      items: _valores.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (valor) {
        setState(() {
          _incidenteSelecionado = valor!;
        });
      },
    );
  }

  Widget textoIncidente() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          hintText: 'Descreva o ocorrido',
        ),
      ),
    );
  }

  Widget botaoRegistra() {
    return ButtonTheme(
      height: 60.0,
      child: ElevatedButton(
          child: Text(
            "Registrar incidente",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
                Navigator.pop(context),
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => pagInicial()))
              }),
    );
  }
}
