import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final VoidCallback callback;
  final int flex; // Butonun ne kadar geniş olacağını belirler (C ve = için kullanacağız)

  const CalculatorButton({
    super.key,
    required this.text,
    required this.fillColor,
    this.textColor = Colors.white, // Varsayılan yazı rengi beyaz
    this.textSize = 20,
    required this.callback,
    this.flex = 1, // Varsayılan genişlik 1 birim
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: fillColor,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Köşeleri hafif yuvarlatılmış
            ),
            padding: const EdgeInsets.all(16.0),
            elevation: 0,
          ),
          onPressed: callback,
          // Eğer metin "⌫" ise ikon göster, değilse normal yazı göster
          child: text == '⌫' 
              ? const Icon(Icons.backspace_outlined, size: 22)
              : Text(
                  text,
                  style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w600),
                ),
        ),
      ),
    );
  }
}