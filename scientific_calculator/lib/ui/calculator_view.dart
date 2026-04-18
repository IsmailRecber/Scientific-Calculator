import 'package:flutter/material.dart';
import 'calculator_button.dart';
import '../logic/calculator_engine.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String displayText = "0";

 void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        // Eşittir'e basıldıysa hesaplama motoruna gönder
        displayText = CalculatorEngine.evaluate(displayText);
      } else if (buttonText == 'del') {
        // Silme tuşu: Son karakteri sil, tek karakter kaldıysa 0 yap
        if (displayText.length > 1) {
          displayText = displayText.substring(0, displayText.length - 1);
        } else {
          displayText = "0";
        }
      } else {
        // Ekran hata veriyorsa veya sadece 0 varsa, yeni girilen rakamla değiştir
        if (displayText == "0" || displayText == "Hata") {
          // Eğer basılan tuş nokta ise "0." olarak kalsın
          if (buttonText == ".") {
            displayText = "0.";
          } else {
            displayText = buttonText;
          }
        } else {
          // Normal durumlarda yanına ekle
          displayText += buttonText;
        }
      }
    });
  }

  // Sık kullanılan renkleri tanımlayalım (Orijinal tasarıma uygun)
  final Color mathColor = const Color(0xFF607D8B); // Mavi-Gri
  final Color numColor = const Color(0xFF303030);  // Koyu Gri
  final Color opColor = Colors.orange;             // Turuncu
  final Color clearColor = const Color(0xFFEF5350); // Kırmızı
  final Color equalColor = const Color(0xFF66BB6A); // Yeşil

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scientific Calculator', style: TextStyle(color: Colors.white, fontSize: 18)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Ekran (Display) Kısmı
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Text(
                displayText,
                style: const TextStyle(fontSize: 64, fontWeight: FontWeight.w400, color: Colors.white),
              ),
            ),
          ),
          const Divider(color: Colors.white24, height: 1),
          
          // Tuş Takımı (Keypad) Kısmı
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Column(
                children: [
                  Row(children: [
                    CalculatorButton(text: 'sin(', fillColor: mathColor, callback: () => buttonPressed('sin(')),
                    CalculatorButton(text: 'cos(', fillColor: mathColor, callback: () => buttonPressed('cos(')),
                    CalculatorButton(text: 'tan(', fillColor: mathColor, callback: () => buttonPressed('tan(')),
                    CalculatorButton(text: 'log(', fillColor: mathColor, callback: () => buttonPressed('log(')),
                  ]),
                  Row(children: [
                    CalculatorButton(text: 'sqrt(', fillColor: mathColor, callback: () => buttonPressed('sqrt(')),
                    CalculatorButton(text: '^', fillColor: mathColor, callback: () => buttonPressed('^')),
                    CalculatorButton(text: '(', fillColor: mathColor, callback: () => buttonPressed('(')),
                    CalculatorButton(text: ')', fillColor: mathColor, callback: () => buttonPressed(')')),
                  ]),
                  Row(children: [
                    CalculatorButton(text: '7', fillColor: numColor, callback: () => buttonPressed('7')),
                    CalculatorButton(text: '8', fillColor: numColor, callback: () => buttonPressed('8')),
                    CalculatorButton(text: '9', fillColor: numColor, callback: () => buttonPressed('9')),
                    CalculatorButton(text: '÷', fillColor: opColor, callback: () => buttonPressed('/')),
                  ]),
                  Row(children: [
                    CalculatorButton(text: '4', fillColor: numColor, callback: () => buttonPressed('4')),
                    CalculatorButton(text: '5', fillColor: numColor, callback: () => buttonPressed('5')),
                    CalculatorButton(text: '6', fillColor: numColor, callback: () => buttonPressed('6')),
                    CalculatorButton(text: '×', fillColor: opColor, callback: () => buttonPressed('*')),
                  ]),
                  Row(children: [
                    CalculatorButton(text: '1', fillColor: numColor, callback: () => buttonPressed('1')),
                    CalculatorButton(text: '2', fillColor: numColor, callback: () => buttonPressed('2')),
                    CalculatorButton(text: '3', fillColor: numColor, callback: () => buttonPressed('3')),
                    CalculatorButton(text: '-', fillColor: opColor, callback: () => buttonPressed('-')),
                  ]),
                  Row(children: [
                    CalculatorButton(text: '0', fillColor: numColor, callback: () => buttonPressed('0')),
                    CalculatorButton(text: '.', fillColor: numColor, callback: () => buttonPressed('.')),
                    CalculatorButton(text: '⌫', fillColor: clearColor, callback: () => buttonPressed('del')),
                    CalculatorButton(text: '+', fillColor: opColor, callback: () => buttonPressed('+')),
                  ]),
                  Row(children: [
                    // C ve = butonları 2 kat yer kaplıyor (flex: 2)
                    CalculatorButton(text: 'C', fillColor: clearColor, flex: 2, callback: () { setState(() { displayText = "0"; }); }),
                    CalculatorButton(text: '=', fillColor: equalColor, flex: 2, callback: () => buttonPressed('=')),
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}