import 'package:flutter/material.dart';
import 'temperature_converter.dart';

void main() {
  runApp(const TemperatureConverterApp());
}

class TemperatureConverterApp extends StatelessWidget {
  const TemperatureConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Converter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ConvertPage(),
    );
  }
}

/// ConvertPage: Main page for temperature conversion
/// Contains two TextFields (Celsius, Fahrenheit), two buttons, two outputs, and red error text
class ConvertPage extends StatefulWidget {
  const ConvertPage({super.key});

  @override
  State<ConvertPage> createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  // Controllers for the TextFields
  final TextEditingController _celsiusController = TextEditingController();
  final TextEditingController _fahrenheitController = TextEditingController();
  
  // Output values
  String _celsiusOutput = '';
  String _fahrenheitOutput = '';
  
  // Error message
  String _errorMessage = '';

  @override
  void dispose() {
    _celsiusController.dispose();
    _fahrenheitController.dispose();
    super.dispose();
  }

  /// Convert Celsius to Fahrenheit
  void _convertCelsiusToFahrenheit() {
    setState(() {
      _errorMessage = '';
      _fahrenheitOutput = '';
      
      try {
        final double celsius = double.parse(_celsiusController.text);
        final double fahrenheit = celsiusToFahrenheit(celsius);
        _fahrenheitOutput = '${fahrenheit.toStringAsFixed(2)}°F';
      } catch (e) {
        _errorMessage = 'Error: Invalid Celsius value';
      }
    });
  }

  /// Convert Fahrenheit to Celsius
  void _convertFahrenheitToCelsius() {
    setState(() {
      _errorMessage = '';
      _celsiusOutput = '';
      
      try {
        final double fahrenheit = double.parse(_fahrenheitController.text);
        final double celsius = fahrenheitToCelsius(fahrenheit);
        _celsiusOutput = '${celsius.toStringAsFixed(2)}°C';
      } catch (e) {
        _errorMessage = 'Error: Invalid Fahrenheit value';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Temperature Converter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo
            Center(
              child: Image.asset(
                'assets/logo.png',
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.thermostat,
                    size: 100,
                    color: Colors.blue,
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            
            // Celsius Section
            const Text(
              'Celsius to Fahrenheit',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _celsiusController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Celsius',
                hintText: 'Enter temperature in Celsius',
                suffixText: '°C',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _convertCelsiusToFahrenheit,
              child: const Text('Convert to Fahrenheit'),
            ),
            const SizedBox(height: 8),
            // Fahrenheit Output
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _fahrenheitOutput.isEmpty ? 'Result will appear here' : _fahrenheitOutput,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: _fahrenheitOutput.isEmpty ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 32),
            
            // Fahrenheit Section
            const Text(
              'Fahrenheit to Celsius',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _fahrenheitController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Fahrenheit',
                hintText: 'Enter temperature in Fahrenheit',
                suffixText: '°F',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _convertFahrenheitToCelsius,
              child: const Text('Convert to Celsius'),
            ),
            const SizedBox(height: 8),
            // Celsius Output
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                _celsiusOutput.isEmpty ? 'Result will appear here' : _celsiusOutput,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: _celsiusOutput.isEmpty ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Error Message (Red)
            if (_errorMessage.isNotEmpty)
              Text(
                _errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
