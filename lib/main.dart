import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Calculadora IMC'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.restart_alt),),
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
                labelText: 'Informe seu peso',
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
                  labelText: 'Informe sua altura (em cm)',
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
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.amber,
                    ),
                    onPressed: (){},
                      child: const Padding(
                        padding:  EdgeInsets.all(10),
                        child:  Text('Calcular',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Resultado: '),
              ],
            )
          ],
        ),
      ),
    );
  }
}

