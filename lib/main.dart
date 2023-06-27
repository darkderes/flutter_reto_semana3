import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarjeta de Crédito',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CreditCardScreen(),
    );
  }
}

class CreditCardScreen extends StatefulWidget {
  const CreditCardScreen({super.key});

  @override
  State<CreditCardScreen> createState() => _CreditCardScreenState();
}

class _CreditCardScreenState extends State<CreditCardScreen> {
  String _nombre = 'Default';
  String _cardNumber = 'Default';
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  var cpfController = new MaskedTextController(text: '1234567890123456', mask: '0000  0000   0000   0000');

  @override
  void dispose() {
    _nombreController.dispose();
    _cardNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      'assets/images/card.jpg', // Ruta de la imagen de la tarjeta de crédito
      width: 600,
      height: 180,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjeta de Crédito'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  image,
                   Positioned(
                    bottom: 50,
                    left: 180,
                    child: Text(
                      cpfController.text,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                   left: 180,
                    child: Text(
                      _nombre,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: textBox('Nombre del Titular', _nombreController),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: textBox('Número de Tarjeta',_cardNumberController),
            ),
          ],
        ),
      ),
    );
  }

  TextField textBox(String label, [TextEditingController? controller]) {
    return TextField(
      controller: controller,
      onChanged: (text) {
        setState(() {
          if(controller == _nombreController) {
            _nombre = _nombreController.text;
          } else {
            _cardNumber = _cardNumberController.text;
            cpfController.updateText(_cardNumber);
          }
         
        });
      },
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
