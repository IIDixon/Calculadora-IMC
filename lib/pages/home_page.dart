import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? errorTextPeso;
  String? errorTextAltura;
  String? resultado;

  void reset(){
    setState(() {
      pesoController.clear();
      alturaController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){ reset(); },
            icon: const Icon(Icons.restart_alt),
            tooltip: 'Redefinir Campos',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 23,
              ),
              decoration: InputDecoration(
                  errorText: errorTextPeso,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      )
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      )
                  ),
                  labelText: 'Peso (kg)',
                  hintText: 'Ex. 70',
                  hintStyle: const TextStyle(
                    color: Colors.amber,
                  ),
                  labelStyle: const TextStyle(
                    fontSize: 22,
                    color: Colors.amber,
                  ),
                  suffixText: 'kg',
                  suffixStyle: const TextStyle(
                    fontSize: 22,
                    color: Colors.amber,
                  )
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 23,
                color: Colors.amber,
              ),
              decoration: InputDecoration(
                  errorText: errorTextAltura,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      )
                  ),
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber,
                      )
                  ),
                  labelText: 'Altura (cm)',
                  labelStyle: const TextStyle(
                    fontSize: 22,
                    color: Colors.amber,
                  ),
                  hintText: 'Ex. 170',
                  hintStyle: const TextStyle(
                    color: Colors.amber,
                  ),
                  suffixText: 'cm',
                  suffixStyle: const TextStyle(
                    fontSize: 22,
                    color: Colors.amber,
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                      ),
                      onPressed: (){},
                      child: const Padding(
                        padding:  EdgeInsets.all(10),
                        child:  Text('Calcular',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Resultado',
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

