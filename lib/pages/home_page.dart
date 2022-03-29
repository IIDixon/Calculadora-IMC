import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  var mask = new MaskTextInputFormatter(mask: '#.##');

  String? errorTextPeso;
  String? errorTextAltura;
  String resultado = '';
  String nivel = '';

  void reset(){
    setState(() {
      pesoController.clear();
      alturaController.clear();
      errorTextAltura = null;
      errorTextPeso =null;
      resultado = '';
      nivel = '';
    });
  }

  bool verificaAltura(){
    if(alturaController == null){
      errorTextAltura = 'Campo Obrigatório';
      return false;
    }
    return true;
  }

  bool verificaPeso(){
    if(pesoController == null){
      setState(() {
        errorTextPeso = 'Campo obrigatório';
      });
      return false;
    }
    return true;
  }

  String calculaImc(double peso, double altura){
    return (double.parse(pesoController.text) / (double.parse(alturaController.text) * double.parse(alturaController.text))).toStringAsPrecision(4);
  }

  String calculaNivelImc(double imc){
    if(imc < 16){
      return 'Magreza grave';
    }else if(imc > 16 && imc < 17){
      return 'Magreza moderada';
    } else if(imc > 17 && imc < 18.5){
      return 'Magreza leve';
    } else if(imc > 18.5 && imc < 25){
      return 'Saudável';
    } else if(imc > 25 && imc < 30){
      return 'Sobrepeso';
    } else if(imc > 30 && imc < 35){
      return 'Obesidade Grau I';
    } else if(imc > 35 && imc < 40){
      return 'Obesidade Grau II (Severa)';
    } else if (imc >= 40){
      return 'Obesidade Grau III (Mórbida)';
    } else{
      return 'Não foi possível realizar o cálculo';
    }
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
            icon: const Icon(Icons.refresh),
            tooltip: 'Redefinir Campos',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.person_outline,
                  size: 120,
                  color: Colors.amber,
                ),
              ],
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.amber,
                fontSize: 23,
              ),
              decoration:  InputDecoration(
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
              inputFormatters: [mask],
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
                      onPressed: (){
                        if(verificaPeso() && verificaAltura()){
                          setState(() {
                            resultado = calculaImc(double.parse(pesoController.text), double.parse(alturaController.text));
                            nivel = calculaNivelImc(double.parse(resultado));
                          });
                        }
                        return;
                      },
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
                children: [
                  Text('Resultado: $resultado - $nivel',
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

