import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: Brightness.light,
        textTheme: TextTheme(
          headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), // Updated
          bodyLarge: TextStyle(fontSize: 18), // Updated
        ),
      ),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _selectedCalculator = '';
  String _output = '';

  final TextEditingController _input1 = TextEditingController();
  final TextEditingController _input2 = TextEditingController();

  // Define individual calculator widgets

  // BMI Calculator
  Widget _buildBMICalculator() {
    return _buildCalculatorWidget(
      'BMI Calculator',
      'Enter your weight (kg)',
      'Enter your height (m)',
          () {
        double weight = double.parse(_input1.text);
        double height = double.parse(_input2.text);
        double bmi = weight / (height * height);
        setState(() {
          _output = 'Your BMI is ${bmi.toStringAsFixed(2)}';
        });
      },
    );
  }

  // Tip Calculator
  Widget _buildTipCalculator() {
    return _buildCalculatorWidget(
      'Tip Calculator',
      'Enter Bill Amount',
      'Enter Tip Percentage',
          () {
        double bill = double.parse(_input1.text);
        double tipPercentage = double.parse(_input2.text);
        double tipAmount = bill * (tipPercentage / 100);
        double totalAmount = bill + tipAmount;
        setState(() {
          _output = 'Total with Tip: \$${totalAmount.toStringAsFixed(2)}';
        });
      },
    );
  }

  // Age Calculator
  Widget _buildAgeCalculator() {
    return _buildCalculatorWidget(
      'Age Calculator',
      'Enter Date of Birth (YYYY-MM-DD)',
      '',
          () {
        DateTime birthDate = DateTime.parse(_input1.text);
        Duration age = DateTime.now().difference(birthDate);
        int years = (age.inDays / 365).floor();
        setState(() {
          _output = 'Your age is $years years';
        });
      },
      singleInput: true,
    );
  }

  // Currency Converter
  Widget _buildCurrencyConverter() {
    return _buildCalculatorWidget(
      'Currency Converter',
      'Enter amount in USD',
      'Enter conversion rate to other currency',
          () {
        double amount = double.parse(_input1.text);
        double rate = double.parse(_input2.text);
        double converted = amount * rate;
        setState(() {
          _output = 'Converted Amount: ${converted.toStringAsFixed(2)}';
        });
      },
    );
  }

  // Quadratic Equation Solver
  Widget _buildQuadraticSolver() {
    return _buildCalculatorWidget(
      'Quadratic Solver',
      'Enter coefficient a',
      'Enter coefficient b and c',
          () {
        double a = double.parse(_input1.text);
        double b = double.parse(_input2.text);
        double discriminant = b * b - 4 * a;
        if (discriminant < 0) {
          setState(() {
            _output = 'No real roots';
          });
        } else {
          double root1 = (-b + discriminant) / (2 * a);
          double root2 = (-b - discriminant) / (2 * a);
          setState(() {
            _output = 'Roots: $root1 and $root2';
          });
        }
      },
    );
  }

  // Discount Calculator
  Widget _buildDiscountCalculator() {
    return _buildCalculatorWidget(
      'Discount Calculator',
      'Enter original price',
      'Enter discount percentage',
          () {
        double price = double.parse(_input1.text);
        double discount = double.parse(_input2.text);
        double finalPrice = price - (price * (discount / 100));
        setState(() {
          _output = 'Final Price: \$${finalPrice.toStringAsFixed(2)}';
        });
      },
    );
  }

  // Temperature Converter
  Widget _buildTemperatureConverter() {
    return _buildCalculatorWidget(
      'Temperature Converter',
      'Enter temperature in Celsius',
      '',
          () {
        double temp = double.parse(_input1.text);
        double fahrenheit = (temp * 9 / 5) + 32;
        setState(() {
          _output = 'Temperature in Fahrenheit: ${fahrenheit.toStringAsFixed(2)}';
        });
      },
      singleInput: true,
    );
  }

  // Speed Distance Time Calculator
  Widget _buildSpeedDistanceTimeCalculator() {
    return _buildCalculatorWidget(
      'Speed, Distance, Time',
      'Enter speed (km/h)',
      'Enter time (hours)',
          () {
        double speed = double.parse(_input1.text);
        double time = double.parse(_input2.text);
        double distance = speed * time;
        setState(() {
          _output = 'Distance: $distance km';
        });
      },
    );
  }

  // Fuel Efficiency Calculator
  Widget _buildFuelEfficiencyCalculator() {
    return _buildCalculatorWidget(
      'Fuel Efficiency Calculator',
      'Enter distance (km)',
      'Enter fuel used (liters)',
          () {
        double distance = double.parse(_input1.text);
        double fuel = double.parse(_input2.text);
        double efficiency = distance / fuel;
        setState(() {
          _output = 'Fuel Efficiency: ${efficiency.toStringAsFixed(2)} km/l';
        });
      },
    );
  }

  // Helper method to build calculator UI
  Widget _buildCalculatorWidget(String title, String hint1, String hint2, VoidCallback onPressed,
      {bool singleInput = false}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineSmall), // Updated
          SizedBox(height: 10),
          TextField(
            controller: _input1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: hint1,
              border: OutlineInputBorder(),
            ),
          ),
          if (!singleInput) ...[
            SizedBox(height: 10),
            TextField(
              controller: _input2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: hint2,
                border: OutlineInputBorder(),
              ),
            ),
          ],
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.all(16),
              backgroundColor: Colors.teal, // Updated
            ),
            child: Text('Calculate'),
          ),
          SizedBox(height: 16),
          Text(_output, style: Theme.of(context).textTheme.bodyLarge), // Updated
        ],
      ),
    );
  }

  // Main build method for the home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      body: Column(
        children: [
          if (_selectedCalculator == '')
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Select a Calculator',
                        style: Theme.of(context).textTheme.headlineSmall, // Updated
                      ),
                      SizedBox(height: 20),
                      _buildCalculatorButton('BMI Calculator', 'BMI'),
                      _buildCalculatorButton('Tip Calculator', 'Tip'),
                      _buildCalculatorButton('Age Calculator', 'Age'),
                      _buildCalculatorButton('Currency Converter', 'Currency'),
                      _buildCalculatorButton('Quadratic Solver', 'Quadratic'),
                      _buildCalculatorButton('Discount Calculator', 'Discount'),
                      _buildCalculatorButton('Temperature Converter', 'Temperature'),
                      _buildCalculatorButton('Speed, Distance, Time', 'Speed'),
                      _buildCalculatorButton('Fuel Efficiency Calculator', 'Fuel'),
                    ],
                  ),
                ),
              ),
            ),
          if (_selectedCalculator == 'BMI') _buildBMICalculator(),
          if (_selectedCalculator == 'Tip') _buildTipCalculator(),
          if (_selectedCalculator == 'Age') _buildAgeCalculator(),
          if (_selectedCalculator == 'Currency') _buildCurrencyConverter(),
          if (_selectedCalculator == 'Quadratic') _buildQuadraticSolver(),
          if (_selectedCalculator == 'Discount') _buildDiscountCalculator(),
          if (_selectedCalculator == 'Temperature') _buildTemperatureConverter(),
          if (_selectedCalculator == 'Speed') _buildSpeedDistanceTimeCalculator(),
          if (_selectedCalculator == 'Fuel') _buildFuelEfficiencyCalculator(),
          if (_selectedCalculator != '')
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedCalculator = '';
                  });
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(16),
                ),
                child: Text('Back to Calculators'),
              ),
            ),
        ],
      ),
    );
  }

  // Button widget for each calculator
  Widget _buildCalculatorButton(String label, String calculatorType) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          setState(() {
            _selectedCalculator = calculatorType;
            _output = '';
            _input1.clear();
            _input2.clear();
          });
        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.tealAccent, Colors.teal],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
