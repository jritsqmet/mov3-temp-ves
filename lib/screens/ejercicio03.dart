import 'package:flutter/material.dart';

class Ejercicio03 extends StatelessWidget {
  const Ejercicio03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 03"),
      ),
      body: Column(
        children: [
            Text("Ejercicio 03"),
            dolar_input(),
            calcular_btn(context)
        ],
      )
    );
  }
}

TextEditingController _dolar = TextEditingController();
Widget dolar_input(){
  return TextField(
    controller: _dolar,
  );
}

Widget calcular_btn(context){
  return IconButton(onPressed: ()=>calcular(context), 
  icon: Icon(Icons.calculate_rounded, size: 75, color: Color.fromRGBO(18, 108, 199, 1),)
  );
}

void calcular(context){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text("Respuesta"),
      content: Text(transformacion(), style: TextStyle(fontSize: 20),),
    );
  });
}


String transformacion(){
  double dolar = double.parse(_dolar.text);

  double euro = dolar * 0.95;
  double yen = dolar * 127.9;

  return "$dolar USD en euros es $euro \n$dolar en yenes es $yen ";
}