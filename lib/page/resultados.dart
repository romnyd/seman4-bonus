import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  final int age, weight, height;
  final bool gender;
  String results = "", message = "";
  double value = 0;
  Color color = Colors.white;

  ResultadoPage(
      {required this.age,
      required this.weight,
      required this.height,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC Bonus"),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    resultOperation();
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10, 20, 0, 20),
          child: Text(
            "Resultado",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[800],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                    "$results",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                ),
                Center(
                  child: Text(
                    "$value",
                    style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    "$message",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 90,
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pink)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void resultOperation() {
    value = height / 100;
    value *= value;
    value = weight / value;
    value = double.parse(value.toStringAsFixed(1));
    if (value < 18.5) {
      results = "BAJO PESO";
      message = "Su peso corporal esta bajo. ¡Cuidado!";
      color = Colors.yellow;
    } else if (value < 24.9) {
      results = "NORMAL";
      message = "Su peso corporal esta normal. ¡Buen trabajo!";
      color = Colors.green;
    } else if (value < 29.9) {
      results = "SOBREPESO";
      message = "Cuidado usted tiene sobrepeso. ¡Por favor tomar medidas!";
      color = Colors.yellow;
    } else if (value < 34.5) {
      results = "OBESIDAD GRADO I";
      message =
          "Usted Tiene obesidad nivel 1. ¡Ten cuidado, esto es una enfermedad!";
      color = Colors.amber;
    } else if (value < 39.9) {
      results = "OBESIDAD GRADO II";
      message =
          "Usted tiene obesidad nivel 2. Por favor cuidese, esto es grave!";
      color = Colors.orange;
    } else {
      results = "OBESIDAD GRADO III";
      message =
          "Usted tiene obesidad nivel 3. Cuidado, alerta roja, su salud corre peligro!";
      color = Colors.red;
    }
  }
}
