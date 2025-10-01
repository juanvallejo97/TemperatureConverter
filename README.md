# TemperatureConverter

A minimal Flutter temperature converter app compatible with FlutterFlow.

## Features

- Convert Celsius to Fahrenheit
- Convert Fahrenheit to Celsius
- Clean, simple UI with two TextFields, two buttons, and two output displays
- Red error text for invalid inputs
- Pure conversion functions with exact signatures

## Project Structure

```
lib/
  main.dart                    # Main app with ConvertPage UI
  temperature_converter.dart   # Pure conversion functions
test/
  temperature_converter_test.dart  # Unit tests (0↔32, 100↔212, −40↔−40)
assets/
  logo.png.placeholder        # Placeholder for logo asset
```

## Conversion Functions

The app includes two pure functions with exact signatures:

```dart
double celsiusToFahrenheit(double c);  // Formula: F = (C × 9/5) + 32
double fahrenheitToCelsius(double f);  // Formula: C = (F - 32) × 5/9
```

## Running the App

### Standard Flutter

1. Install Flutter: https://flutter.dev/docs/get-started/install
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to launch the app
4. Run `flutter test` to execute unit tests

### Mapping to FlutterFlow

This repository is structured to be compatible with FlutterFlow. Here's how to map the components:

#### 1. Project Setup
- Import this project into FlutterFlow or create a new FlutterFlow project
- Add custom code files from `lib/` directory

#### 2. ConvertPage Components
- **Page**: Create a page named "ConvertPage"
- **TextFields**: 
  - Celsius TextField: Text input with number keyboard
  - Fahrenheit TextField: Text input with number keyboard
- **Buttons**:
  - "Convert to Fahrenheit" button (calls `celsiusToFahrenheit`)
  - "Convert to Celsius" button (calls `fahrenheitToCelsius`)
- **Outputs**:
  - Fahrenheit output: Container with grey background
  - Celsius output: Container with grey background
- **Error Text**: Text widget with red color for error messages

#### 3. Custom Functions
In FlutterFlow, add the conversion functions as Custom Functions:
- Go to Custom Code → Custom Functions
- Create `celsiusToFahrenheit` with parameter `double c` and return type `double`
- Create `fahrenheitToCelsius` with parameter `double f` and return type `double`
- Copy the function implementations from `lib/temperature_converter.dart`

#### 4. Assets
- Upload your logo to FlutterFlow assets (replace placeholder)
- Reference it in the ConvertPage UI

#### 5. Actions
Wire up the buttons:
- "Convert to Fahrenheit" button → Call custom function → Update state → Display result
- "Convert to Celsius" button → Call custom function → Update state → Display result
- Add error handling with try-catch for invalid inputs

## Publishing to Web

### Using Flutter CLI

1. Ensure Flutter web support is enabled:
   ```bash
   flutter config --enable-web
   ```

2. Build for web:
   ```bash
   flutter build web
   ```

3. Deploy the `build/web` directory to your hosting service:
   - **Firebase Hosting**: `firebase deploy`
   - **GitHub Pages**: Copy contents of `build/web` to gh-pages branch
   - **Netlify/Vercel**: Connect repository and set build command to `flutter build web`

### Using FlutterFlow

1. Open your project in FlutterFlow
2. Click on "Deploy" in the top menu
3. Select "Web" as the deployment target
4. Choose your hosting option:
   - **FlutterFlow Hosting**: One-click deploy to FlutterFlow's hosting
   - **Custom Domain**: Configure your custom domain settings
   - **Download Web Build**: Download and deploy to your own hosting

5. Configure web settings:
   - Set base URL
   - Configure meta tags for SEO
   - Enable PWA features if desired

6. Click "Deploy" and wait for the build to complete
7. Your app will be live at the provided URL

## Unit Tests

The project includes comprehensive unit tests covering the key conversion points:

- 0°C ↔ 32°F (freezing point of water)
- 100°C ↔ 212°F (boiling point of water)
- −40°C ↔ −40°F (point where scales intersect)

Run tests with:
```bash
flutter test
```

## No Extra Packages

This project uses only core Flutter dependencies:
- `flutter` (SDK)
- `flutter_test` (SDK, for testing)
- `flutter_lints` (code quality)

No third-party packages are required, keeping the app lightweight and maintainable.
