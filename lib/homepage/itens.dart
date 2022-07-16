import 'package:flutter/material.dart';

class itensMenu extends StatefulWidget {
  
  const itensMenu({Key? key})
      : super(key: key);

  @override
  State<itensMenu> createState() => _itensMenuState();
}

class _itensMenuState extends State<itensMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [botaoMenu(Icons.abc_rounded, "Me ajuda"),
      botaoMenu(Icons.abc_rounded, "Me ajuda"), 
      botaoMenu(Icons.abc_rounded, "Me ajuda"), 
      botaoMenu(Icons.abc_rounded, "Me ajuda"), ],
    );
  }

  botaoMenu(IconData icon, String text) {
    return Container(
      padding: EdgeInsets.all(5),
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 5),        
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(icon),
              SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          onPressed: () {},
        ),
    );
  }
}
