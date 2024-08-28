import 'package:i/i.dart';

void main() {
  Complex num1 = Complex(2, 3);
  Complex num2 = Complex(4, 5);

  var num = 1.r + 2;

  print(num);

  print('num1: $num1');
  print('num2: $num2');
  print('Addition: ${num1 + num2}');
  print('Subtraction: ${num1 - num2}');
  print('Multiplication: ${num1 * num2}');
  print('Division: ${num1 / num2}');
}
