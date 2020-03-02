import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: MiDialogo(),
  ));
}

// Declaro un "enum" que me servirá para saber si se pulsó el botón "Si" o "No" en mi AlertDialog.
enum AccionDialogo{
  si,
  no
}

class MiDialogo extends StatefulWidget {
  @override
  _MiDialogoState createState() => new _MiDialogoState();
}

class _MiDialogoState extends State <MiDialogo> {
  String _valorInput = "";

  // Al colocar un "_" al principio del nombre de un Método o Variable, estamos diciendo que el/la mismo/a será privada para la clase en la cual fue creado/a.
  void _mostrarAlerta(String valor) {
    AlertDialog dialog = new AlertDialog(
      title: new Text("Escribiste: "),
      content: new Text(valor),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {_resultadoAlerta(AccionDialogo.si);},
            child: new Text("Es correcto! :D")),
        new FlatButton(
            onPressed: () {_resultadoAlerta(AccionDialogo.no);},
            child: new Text("No es correcto :("))
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => dialog,
    );
  }

  void _onChanged(String value) {
    setState(() {
      _valorInput = value;
    });
  }

  void _resultadoAlerta(AccionDialogo accion){
    print("Pulsaste en $accion");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Alert Dialog ejemplo"),
      ),
      body: new Container(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(
                      hintText: "Escribe algo divertido"
                  ),
                  onChanged: (String value) {
                    _onChanged(value);
                  },
                ),
                new RaisedButton(
                    child: new Text("Toca acá :)"),
                    onPressed: () {
                      _mostrarAlerta(_valorInput);
                    })
              ],
            ),
          )
      ),
    );
  }
}