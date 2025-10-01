import 'package:flutter_test/flutter_test.dart';
import 'package:temperature_converter/temperature_converter.dart';

void main() {
  group('Temperature Conversion Tests', () {
    test('0°C should equal 32°F', () {
      expect(celsiusToFahrenheit(0), equals(32));
    });

    test('32°F should equal 0°C', () {
      expect(fahrenheitToCelsius(32), equals(0));
    });

    test('100°C should equal 212°F', () {
      expect(celsiusToFahrenheit(100), equals(212));
    });

    test('212°F should equal 100°C', () {
      expect(fahrenheitToCelsius(212), equals(100));
    });

    test('-40°C should equal -40°F', () {
      expect(celsiusToFahrenheit(-40), equals(-40));
    });

    test('-40°F should equal -40°C', () {
      expect(fahrenheitToCelsius(-40), equals(-40));
    });
  });
}
