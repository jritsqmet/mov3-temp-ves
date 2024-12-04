import 'package:app_04/screens/ejercicio03.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Ejercicio02());
}

class Ejercicio02 extends StatelessWidget {
  const Ejercicio02({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ejercicio 02"),
        ),
        body: Column(
          children: [
            const Text(
              "Ejercicio 07",
              style: TextStyle(fontSize: 35),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: nombre_input(),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: edad_input(),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: salario_input(),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: calcular_btn(context),
            ),
            Divider(),
            ejercicio3_bnt(context)
          ],
        )
        // body:
        );
  }
}

TextEditingController _nombre = TextEditingController();
Widget nombre_input() {
  return TextField(
    style: TextStyle(fontSize: 25),
    controller: _nombre,
    decoration: const InputDecoration(
        label: Text(
          "Nombre",
          style: TextStyle(fontSize: 25),
        ),
        border: OutlineInputBorder()),
  );
}

TextEditingController _edad = TextEditingController();
Widget edad_input() {
  return TextField(
    keyboardType: TextInputType.number,
    controller: _edad,
    decoration:
        InputDecoration(label: Text("Edad"), border: OutlineInputBorder()),
  );
}

TextEditingController _salario = TextEditingController();
Widget salario_input() {
  return TextField(
    keyboardType: TextInputType.numberWithOptions(),
    controller: _salario,
    decoration:
        InputDecoration(label: Text("salario"), border: OutlineInputBorder()),
  );
}

Widget calcular_btn(context) {
  return ElevatedButton.icon(
    onPressed: () => mensaje(context),
    label: Text(
      "Calcular salario",
      style: TextStyle(fontSize: 25, color: Color.fromRGBO(215, 190, 190, 1)),
    ),
    style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color.fromRGBO(6, 62, 64, 1))),
  );
}

//Alerta
void mensaje(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_nombre.text),
          content: Text("El salario final es ${salario()}"),
        );
      });
}

double salario() {
  int edad = 0;
  double salario = 0;

  if (_edad.text != "" || _salario.text != "") {

    edad = int.parse(_edad.text);
    salario = double.parse(_salario.text);

    if (edad > 30 && salario > 3000) {
      salario = salario + (salario * 0.1);
    }
  }

  return salario;
}


// ignore: non_constant_identifier_names
Widget ejercicio3_bnt(context){
  return FilledButton(onPressed: ()=> navegar(context), child: const Text("Ir al siguiente ejercicio"));
}

void navegar(context){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> Ejercicio03()  ));
}