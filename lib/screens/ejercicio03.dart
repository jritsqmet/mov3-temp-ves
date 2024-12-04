import 'package:flutter/material.dart';

class Ejercicio03 extends StatelessWidget {
  const Ejercicio03({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ejercicio 03"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network("https://4kwallpapers.com/images/walls/thumbs_3t/2063.jpg",
            fit: BoxFit.cover,
            )
            
            ),

            Column(
              children: [
                Text("Ejercicio 03"),
                dolar_input(),
                calcular_btn(context),
                Image.network("https://4kwallpapers.com/images/walls/thumbs_3t/17525.jpg", width: 300),
                Divider(),
                imagenLocal(),
              ],
            )
        ],
      )
    );
  }
}

TextEditingController _dolar = TextEditingController();
Widget dolar_input(){
  return TextField(
    style: TextStyle(color: Color.fromRGBO(233, 235, 240, 1)),
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
      actions: [
       // TextButton(onPressed: ()=>(), child: Text("Aceptar")),
        FilledButton(onPressed: ()=> Navigator.pop(context), 
        
        child: Text("Cancelar"))
      ],
    );
  });
}


String transformacion(){
  double dolar = double.parse(_dolar.text);

  double euro = dolar * 0.95;
  double yen = dolar * 127.9;

  return "$dolar USD en euros es $euro \n$dolar en yenes es $yen ";
}


//IMAGEN POR URL
Widget imagenURL(){
  return Image.network("https://4kwallpapers.com/images/walls/thumbs_3t/17525.jpg", width: 300
  ,);
}

//IMAGEN LOCAL
Widget imagenLocal (){
  return Image.asset("assets/images/a.jpg", width: 300,);
}