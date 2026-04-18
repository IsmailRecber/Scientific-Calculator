import 'package:flutter/material.dart';
import 'ui/calculator_view.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scientific Calculator',
      debugShowCheckedModeBanner: false, // Sağ üstteki "DEBUG" yazısını kaldırır
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black, // Arka planı simsiyah yapıyoruz
      ),
      home: const CalculatorView(),
    );
  }
}