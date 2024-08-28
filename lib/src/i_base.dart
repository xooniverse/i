import 'dart:math';

/// A class to represent complex numbers and perform basic arithmetic operations.
///
/// A complex number is expressed as `a + bi` where `a` is the real part and `b`
/// is the imaginary part. This class provides methods to add, subtract, multiply,
/// and divide complex numbers.
class Complex implements Comparable<Complex> {
  /// The real part of the complex number.
  final double real;

  /// The imaginary part of the complex number.
  final double imaginary;

  /// Creates a [Complex] number with the given [real] and [imaginary] parts.
  ///
  /// Example:
  /// ```dart
  /// Complex number = Complex(2, 3);
  /// print(number); // Output: 2.00 + 3.00i
  /// ```
  const Complex([this.real = 0, this.imaginary = 0]);

  /// Factory constructor to create a [Complex] number with only the real part.
  ///
  /// This initializes the complex number with the given [real] part and zero
  /// as the imaginary part.
  ///
  /// Example:
  /// ```dart
  /// Complex realOnly = Complex.fromReal(3);
  /// print(realOnly); // Output: 3.00 + 0.00i
  /// ```
  factory Complex.fromReal(num real) {
    return real.r;
  }

  /// Factory constructor to create a [Complex] number with only the imaginary part.
  ///
  /// This initializes the complex number with the given [imaginary] part and zero
  /// as the real part.
  ///
  /// Example:
  /// ```dart
  /// Complex imaginaryOnly = Complex.fromImaginary(4);
  /// print(imaginaryOnly); // Output: 0.00 + 4.00i
  /// ```
  factory Complex.fromImaginary(double imaginary) {
    return imaginary.i;
  }

  /// Adds this complex number to another [Complex] number.
  ///
  /// The result is a new [Complex] number whose real part is the sum of the real
  /// parts of the two numbers and whose imaginary part is the sum of the imaginary
  /// parts of the two numbers.
  ///
  /// Example:
  /// ```dart
  /// Complex num1 = Complex(2, 3);
  /// Complex num2 = Complex(4, 5);
  /// Complex result = num1 + num2;
  /// print(result); // Output: 6.00 + 8.00i
  /// ```
  Complex operator +(Comparable other) {
    if (other is Complex) {
      return Complex(
        real + other.real,
        imaginary + other.imaginary,
      );
    }
    if (other is num) {
      return Complex(real, other.toDouble());
    }

    throw Exception("Other value must be a `num` or `Complex`");
  }

  /// Subtracts another [Complex] number from this complex number.
  ///
  /// The result is a new [Complex] number whose real part is the difference of
  /// the real parts of the two numbers and whose imaginary part is the difference
  /// of the imaginary parts of the two numbers.
  ///
  /// Example:
  /// ```dart
  /// Complex num1 = Complex(4, 5);
  /// Complex num2 = Complex(2, 3);
  /// Complex result = num1 - num2;
  /// print(result); // Output: 2.00 + 2.00i
  /// ```
  Complex operator -(Complex other) {
    return Complex(
      real - other.real,
      imaginary - other.imaginary,
    );
  }

  /// Multiplies this complex number by another [Complex] number.
  ///
  /// The result is a new [Complex] number calculated by the formula:
  /// `(a + bi) * (c + di) = (ac - bd) + (ad + bc)i`
  ///
  /// Example:
  /// ```dart
  /// Complex num1 = Complex(2, 3);
  /// Complex num2 = Complex(4, 5);
  /// Complex result = num1 * num2;
  /// print(result); // Output: -7.00 + 22.00i
  /// ```
  Complex operator *(Complex other) {
    return Complex(
      real * other.real - imaginary * other.imaginary,
      real * other.imaginary + imaginary * other.real,
    );
  }

  /// Divides this complex number by another [Complex] number.
  ///
  /// The result is a new [Complex] number calculated by the formula:
  /// `(a + bi) / (c + di) = [(ac + bd) / (c^2 + d^2)] + [(bc - ad) / (c^2 + d^2)]i`
  ///
  /// Example:
  /// ```dart
  /// Complex num1 = Complex(2, 3);
  /// Complex num2 = Complex(4, 5);
  /// Complex result = num1 / num2;
  /// print(result); // Output: 0.56 + 0.08i
  /// ```
  Complex operator /(Complex other) {
    double denominator =
        other.real * other.real + other.imaginary * other.imaginary;
    return Complex(
      (real * other.real + imaginary * other.imaginary) / denominator,
      (imaginary * other.real - real * other.imaginary) / denominator,
    );
  }

  /// Returns a string representation of this complex number.
  ///
  /// The format is `"a + bi"` where `a` is the real part and `b` is the imaginary
  /// part, both formatted to two decimal places.
  ///
  /// Example:
  /// ```dart
  /// Complex number = Complex(2, 3);
  /// print(number); // Output: 2.00 + 3.00i
  /// ```
  @override
  String toString() {
    return '${real.toStringAsFixed(2)} + ${imaginary.toStringAsFixed(2)}i';
  }

  /// Returns the magnitude (or absolute value) of the complex number.
  ///
  /// The magnitude of a complex number \(a + bi\) is calculated as:
  /// ```
  /// magnitude = sqrt(a^2 + b^2)
  /// ```
  /// where `a` is the real part and `b` is the imaginary part.
  ///
  /// Example:
  /// ```dart
  /// Complex number = Complex(3, 4);
  /// print(number.magnitude); // Output: 5.0
  /// ```
  ///
  /// This value represents the distance of the complex number from the origin
  /// in the complex plane.
  double get magnitude => sqrt(real * real + imaginary * imaginary);

  @override
  int compareTo(Complex other) {
    double thisMagnitude = magnitude;
    double otherMagnitude = other.magnitude;

    if (thisMagnitude < otherMagnitude) return -1;
    if (thisMagnitude > otherMagnitude) return 1;
    return 0;
  }

  /// Returns the conjugate of this complex number.
  ///
  /// The conjugate of a complex number `a + bi` is `a - bi`. This method
  /// provides a new complex number with the same real part but with the
  /// opposite sign for the imaginary part.
  ///
  /// Example:
  /// ```dart
  /// Complex number = Complex(2, 3);
  /// Complex conjugateNumber = number.conjugate();
  /// print(conjugateNumber); // Output: 2.00 - 3.00i
  /// ```
  Complex conjugate() {
    return Complex(real, -imaginary);
  }
}

/// Extension on [num] to simplify the creation of complex numbers.
///
/// This extension provides two getter methods to easily create `Complex`
/// instances from numeric values:
///
/// - `i`: Creates a complex number with the given numeric value as the imaginary part and zero as the real part.
/// - `r`: Creates a complex number with the given numeric value as the real part and zero as the imaginary part.
///
/// Example:
/// ```dart
/// num realPart = 3;
/// num imaginaryPart = 4;
///
/// Complex complexReal = realPart.r;
/// Complex complexImaginary = imaginaryPart.i;
///
/// print(complexReal);       // Output: 3.00 + 0.00i
/// print(complexImaginary);  // Output: 0.00 + 4.00i
/// ```
///
/// These getters provide a convenient way to quickly create complex numbers
/// for use in arithmetic operations or other computations.
extension ComplexNumber on num {
  /// Creates a complex number with the current numeric value as the imaginary part
  /// and zero as the real part.
  ///
  /// Example:
  /// ```dart
  /// num imaginaryPart = 4;
  /// Complex complexNumber = imaginaryPart.i;
  /// print(complexNumber); // Output: 0.00 + 4.00i
  /// ```
  Complex get i => Complex(0, toDouble());

  /// Creates a complex number with the current numeric value as the real part
  /// and zero as the imaginary part.
  ///
  /// Example:
  /// ```dart
  /// num realPart = 3;
  /// Complex complexNumber = realPart.r;
  /// print(complexNumber); // Output: 3.00 + 0.00i
  /// ```
  Complex get r => Complex(toDouble(), 0);
}
