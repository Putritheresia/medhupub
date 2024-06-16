import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';



bool gendermale = false;
double activityLevel = 0;
double coefficient = 0;

final bodyWeightController = TextEditingController();
final ageController = TextEditingController();

String bodyWeightReading = bodyWeightController.text;
String ageReading = ageController.text;

class WaterCalc extends StatefulWidget {
  const WaterCalc({Key? key}) :super(key: key,);

  @override
  _WaterIntakeResultState createState() => _WaterIntakeResultState();
}

class _WaterIntakeResultState extends State<WaterCalc> {
  String result = "";
  String calculatewater(bool gendermale, double activityLevel, double? bodyweight, double? age) {
  if (bodyweight == null || age == null) {
    return result = "ERROR: Please enter a valid number";
  }
  else {
      double baseintake = bodyweight * coefficient;
      if (age >=50) {
        result = (baseintake * activityLevel * 0.9).toString() + "ml";
      } else {
        result = (baseintake * activityLevel).toString() + "ml";
      }
    return result;
  } 
}

void calculateAndDisplayWater(bool gendermale, double activityLevel, String bodyWeightReading, String ageReading) {
    double? bodyweight = double.tryParse(bodyWeightReading);
    double? age = double.tryParse(ageReading);

    if (bodyweight != null && age != null) {
      calculatewater(gendermale, activityLevel, bodyweight, age);
    } else {
      result = "ERROR please only input numbers";
    } 
    setState(() {this.result = result;});
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Water Intake Calculator'; 
    
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 36, 25, 0),
          child: Text(
          appTitle,
          style: TextStyle(
            color: Color.fromRGBO(214, 52, 133, 1),
            fontSize: 32.0,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 28, 25, 0),
              child: TextField(
              controller: bodyWeightController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Enter body weight (kg):',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500 
              ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(214, 52, 133, 1),
                  width: 2
                  ),
                ),
            ),
          ),
        ),

        Padding(
            padding: const EdgeInsets.fromLTRB(25, 32, 25, 0),
              child: TextField(
              controller: ageController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Enter age (year):',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500 
              ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(214, 52, 132, 1),
                  width: 2
                  ),
                ),
              ),
            ),
          ),

        const Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 2.0),
                  child: Text(
                    'Sex:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0),
          child: ToggleSwitch(
                  initialLabelIndex: 0,
                  minWidth: 100,
                  minHeight: 30,
                  activeBgColor: const [Color.fromRGBO(214, 52, 132, 1)],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: const Color.fromRGBO(214, 52, 132, 1),
                  borderWidth: 2.0,
                  borderColor: const [Color.fromRGBO(214, 52, 132, 1)],
                  totalSwitches: 2,
                  labels: const ['Male', 'Female'],
                  icons: const [Icons.male, Icons.female],
                  onToggle: (index) {
                    // ignore: avoid_print
                    print('switched to: $index');
                    if (index == 0) {
                      gendermale = true;
                      coefficient = 35.0;
                    } else {
                      gendermale = false;
                      coefficient = 30.0;
                    }
                  },
                )
              ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 12, 25.0, 0),
                  child: Text(
                    'Activity Level:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 16),
                  child: ToggleSwitch(
                  initialLabelIndex: 0,
                  minWidth: 105,
                  minHeight: 30,
                  activeBgColor: const [Color.fromRGBO(214, 52, 132, 1)],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: const Color.fromRGBO(214, 52, 132, 1),
                  borderWidth: 2.0,
                  borderColor: const [Color.fromRGBO(214, 52, 132, 1)],
                  totalSwitches: 3,
                  labels: const ['Inactive', 'Moderate', 'Very Active'],
                  onToggle: (index) {
                    // ignore: avoid_print
                    print('switched to: $index');
                    if (index == 0) {
                      activityLevel = 1.0;
                    } else if (index == 1) {
                      activityLevel = 1.2;
                    } else {
                      activityLevel = 1.4;
                    }
                  },
                )
              ),

          FloatingActionButton.extended(
            onPressed: () {
              String bodyWeightReading = bodyWeightController.text;
              String ageReading = ageController.text;
              
              calculateAndDisplayWater(gendermale, activityLevel, bodyWeightReading, ageReading);
            },
            backgroundColor: Color.fromARGB(255, 255, 168, 190),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Color.fromRGBO(214, 52, 132, 1), width: 2.0),
            ),
            label: const Text(
              'Calculate',
              style: TextStyle(
                color: Color.fromRGBO(214, 52, 132, 1),
                fontSize: 16.0,
                fontWeight: FontWeight.w500
                ),
              ),
            ),

          const Padding (
          padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
          child: Text(
            'Result',
            style: TextStyle(
              color: Color.fromRGBO(214, 52, 133, 1),
              fontSize: 26.0,
              fontWeight: FontWeight.w600
            ),
          ),
        ),

        const Padding(
            padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Text(
              "Your recommended daily water intake is",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 16),
            child: Text(
              result,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(25, 36, 25, 0),
            child: Text(
              "The result of this calculator is just an estimate based on minimal factors and is not recommended for children under 10, consult a healthcare professional for personalized recommendations.",
              style: TextStyle(
                color: Color.fromRGBO(214, 52, 133, 100),
                fontWeight: FontWeight.w600,
                fontSize: 10.0
              ),
            ),
            ),

          ],
        ),
      ),
    );
  }
}