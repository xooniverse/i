import 'package:i/i.dart';
import 'package:test/test.dart';

void main() {
  group('Complex class tests', () {
    test('Addition of complex numbers', () {
      Complex num1 = Complex(2, 3);
      Complex num2 = Complex(4, 5);
      Complex result = num1 + num2;

      expect(result.real, equals(6.00));
      expect(result.imaginary, equals(8.00));
    });

    test('Subtraction of complex numbers', () {
      Complex num1 = Complex(4, 5);
      Complex num2 = Complex(2, 3);
      Complex result = num1 - num2;

      expect(result.real, equals(2.00));
      expect(result.imaginary, equals(2.00));
    });

    test('Multiplication of complex numbers', () {
      Complex num1 = Complex(2, 3);
      Complex num2 = Complex(4, 5);
      Complex result = num1 * num2;

      expect(result.real, equals(-7.00));
      expect(result.imaginary, equals(22.00));
    });

    test('Magnitude of complex numbers', () {
      Complex num = Complex(3, 4);
      double magnitude = num.magnitude;

      expect(magnitude, closeTo(5.00, 0.01));
    });

    test('Comparison of complex numbers', () {
      Complex num1 = Complex(3, 4);
      Complex num2 = Complex(1, 1);
      Complex num3 = Complex(3, 4);

      expect(num1.compareTo(num2), greaterThan(0));
      expect(num2.compareTo(num1), lessThan(0));
      expect(num1.compareTo(num3), equals(0));
    });

    test('Extension methods for creating complex numbers', () {
      num realPart = 3;
      num imaginaryPart = 4;

      Complex realToComplex = realPart.r;
      Complex imaginaryToComplex = imaginaryPart.i;

      expect(realToComplex.real, equals(3.00));
      expect(realToComplex.imaginary, equals(0.00));
      expect(imaginaryToComplex.real, equals(0.00));
      expect(imaginaryToComplex.imaginary, equals(4.00));
    });
  });
}
