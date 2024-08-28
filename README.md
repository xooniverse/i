# Complex Number Class in Dart

![Dart](https://img.shields.io/badge/Dart-000000?style=flat&logo=dart&logoColor=white)
![Pub](https://img.shields.io/pub/v/i?color=blue)
![GitHub](https://img.shields.io/github/license/xooniverse/i)

## Overview

The `Complex` class in Dart provides a way to represent and perform basic arithmetic operations with complex numbers. A complex number is expressed as `a + bi`, where `a` is the real part and `b` is the imaginary part. This class supports addition, subtraction, multiplication, division, and comparison of complex numbers, along with a method to compute the magnitude.

## Features

- Addition, subtraction, multiplication, and division of complex numbers.
- Comparison of complex numbers based on their magnitude.
- Factory constructors for creating complex numbers with only real or imaginary parts.
- Easy-to-use extension methods for creating complex numbers from numerical values.

## Installation

To use the `Complex` class in your Dart project, include it in your `pubspec.yaml` file:

```yaml
dependencies:
  i: ^1.0.1
```

Then run `dart pub get` to install the dependency.

## Usage

Here's how to use the `Complex` class in your Dart project:

```dart
import 'package:i/i.dart';

void main() {
  // Creating complex numbers
  Complex num1 = Complex(2, 3);
  Complex num2 = Complex.fromReal(4);
  Complex num3 = Complex.fromImaginary(5);

  print('num1: $num1'); // Output: 2.00 + 3.00i
  print('num2: $num2'); // Output: 4.00 + 0.00i
  print('num3: $num3'); // Output: 0.00 + 5.00i

  // Performing arithmetic operations
  Complex sum = num1 + num2;
  Complex difference = num1 - num2;
  Complex product = num1 * num2;
  Complex quotient = num1 / num2;

  print('Addition: $sum'); // Output: 6.00 + 3.00i
  print('Subtraction: $difference'); // Output: -2.00 + 3.00i
  print('Multiplication: $product'); // Output: -10.00 + 15.00i
  print('Division: $quotient'); // Output: 0.56 + 0.08i

  // Comparison
  Complex num4 = Complex(3, 4);
  print('Comparison result: ${num1.compareTo(num4)}'); // Output: -1, 0, or 1 based on magnitude
}
```

## Methods

### `Complex(double real, double imaginary)`

Creates a new complex number with the given real and imaginary parts.

### `factory Complex.fromReal(double real)`

Creates a new complex number with the given real part and zero as the imaginary part.

### `factory Complex.fromImaginary(double imaginary)`

Creates a new complex number with the given imaginary part and zero as the real part.

### `Complex operator +(Complex other)`

Adds this complex number to another complex number.

### `Complex operator -(Complex other)`

Subtracts another complex number from this complex number.

### `Complex operator *(Complex other)`

Multiplies this complex number by another complex number.

### `Complex operator /(Complex other)`

Divides this complex number by another complex number.

### `double get magnitude`

Returns the magnitude of this complex number, calculated as the square root of the sum of the squares of the real and imaginary parts.

### `int compareTo(Complex other)`

Compares this complex number to another complex number based on their magnitudes.

## Extensions

### `ComplexNumber`

Provides convenient extension methods to create complex numbers:

- `Complex get i` - Creates a complex number with zero real part and the given numerical value as the imaginary part.
- `Complex get r` - Creates a complex number with the given numerical value as the real part and zero imaginary part.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
