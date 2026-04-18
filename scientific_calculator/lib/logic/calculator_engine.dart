import 'package:math_expressions/math_expressions.dart';

class CalculatorEngine {
  static String evaluate(String equation) {
    try {
      String parsedEquation = equation.replaceAll('log(', 'ln(');

      // --- AKILLI PARANTEZ TAMAMLAMA SİSTEMİ ---
      // Açılan ve kapanan parantez sayılarını buluyoruz
      int openParenCount = parsedEquation.split('(').length - 1;
      int closeParenCount = parsedEquation.split(')').length - 1;
      
      // Eğer açılan parantez kapanandan fazlaysa, eksik olanları formülün sonuna ekliyoruz
      if (openParenCount > closeParenCount) {
        int missingCount = openParenCount - closeParenCount;
        parsedEquation += ')' * missingCount; // Eksik kadar ')' ekle
      }
      // -----------------------------------------

      Parser p = Parser();
      Expression exp = p.parse(parsedEquation);
      ContextModel cm = ContextModel();
      
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      
      if (eval == eval.toInt()) {
        return eval.toInt().toString();
      }
      return eval.toString();
      
    } catch (e) {
      return "Hata"; 
    }
  }
}