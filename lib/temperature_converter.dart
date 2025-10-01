/// Pure function to convert Celsius to Fahrenheit
/// Formula: F = (C × 9/5) + 32
double celsiusToFahrenheit(double c) {
  return (c * 9 / 5) + 32;
}

/// Pure function to convert Fahrenheit to Celsius
/// Formula: C = (F - 32) × 5/9
double fahrenheitToCelsius(double f) {
  return (f - 32) * 5 / 9;
}
