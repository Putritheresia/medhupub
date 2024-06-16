import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toggle_switch/toggle_switch.dart';

bool type1 = false;
bool noeat = false;

final bloodsugarcontroller = TextEditingController();

String bloodSugarReading = bloodsugarcontroller.text;

class BloodSugarCalc extends StatefulWidget {
  const BloodSugarCalc({Key? key})
  :super(key: key);

  @override
  _BloodSugarResultState createState() => _BloodSugarResultState();
}

class _BloodSugarResultState extends State<BloodSugarCalc> {
  String result = "";
  String calculateresult(bool type1, bool noeat, double? bloodsugar) {
  if (bloodsugar == null) {
    return result = "ERROR: Please enter a valid blood sugar reading";
  }
  else {
    
  if (bloodsugar < 72.0) {
    result =  "Low";
  } 
  if (type1 == true) {
    if (noeat == true) {
      if (bloodsugar <= 126.0) {
        result = "Normal";
      } else {
        result = "High";
      }
    } else {
      if (bloodsugar < 90) {
        result = "Low";
      } else if (bloodsugar < 162){
        result = "Normal";
      } else {
        result = "High";
      }
    }
  } else {
    if (noeat == true) {
      if (bloodsugar <= 126.0) {
        result = "Normal";
      } else {
        result = "High";
      }
    } else {
      if (bloodsugar < 153.0) {
        result = "Normal";
      } else {
        result = "High";
      }
    }
  }
    return result;
  }
}

void calculateAndDisplayResult(bool type1, bool noeat, String bloodSugarReading) {
    double? bloodsugar = double.tryParse(bloodSugarReading);
    if (bloodsugar != null) {
      calculateresult(type1, noeat, bloodsugar);
    } else {
      result = "ERROR please only input numbers";
    } 
    setState(() {this.result = result;});
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Blood Sugar Level Calculator'; 
    
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: Scaffold( 
        backgroundColor: Colors.white, 
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(25, 48, 25, 0),
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
            padding: const EdgeInsets.fromLTRB(25, 36, 25, 0),
              child: TextField(
              controller: bloodsugarcontroller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Enter blood sugar reading (mg/dL):',
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
        const Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 0),
                  child: Text(
                    'Type of Diebetes:',
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
                  minHeight: 40,
                  activeBgColor: const [Color.fromRGBO(214, 52, 133, 1)],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: const Color.fromARGB(255, 214, 52, 133),
                  borderWidth: 2.0,
                  borderColor: const [Color.fromRGBO(214, 52, 133, 1)],
                  totalSwitches: 2,
                  labels: const ['Type 1', 'Type 2'],
                  onToggle: (index) {
                    index = index;
                    // ignore: avoid_print
                    print('switched to: $index');
                    if (index == 0) {
                      type1 = true;
                    } else {
                      type1 = false;
                    }
            },
          )
        ),
        const Padding(
                  padding: EdgeInsets.fromLTRB(25.0, 16.0, 25.0, 0),
                  child: Text(
                    'Have Eaten in the Last Two Hours:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
       
        Padding(
          padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 28),
          child: ToggleSwitch(
                  initialLabelIndex: 0,
                  minWidth: 100,
                  minHeight: 40,
                  activeBgColor: const [Color.fromRGBO(214, 52, 132, 1)],
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.white,
                  inactiveFgColor: const Color.fromRGBO(214, 52, 132, 1),
                  borderWidth: 2.0,
                  borderColor: const [Color.fromRGBO(214, 52, 132, 1)],
                  totalSwitches: 2,
                  labels: const ['No', 'Yes'],
                  onToggle: (index) {
                    index = index;
                    // ignore: avoid_print
                    print('switched to: $index');
                    if (index == 0) {
                    noeat = true;
                  } else {
                    noeat = false;
                }
              },
            )
          ),

          FloatingActionButton.extended(
            onPressed: () {
              CollectionReference collRef = FirebaseFirestore.instance.collection('result');
              collRef.add({
                'glucose': bloodsugarcontroller.text
              }
              );
              String bloodSugarReading = bloodsugarcontroller.text;
              calculateAndDisplayResult(type1, noeat, bloodSugarReading);
            },
            backgroundColor: const Color.fromARGB(255, 255, 168, 190),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: const BorderSide(color: Color.fromRGBO(214, 52, 133, 1), width: 2.0),
            ),
            label: const Text(
              'Calculate',
              style: TextStyle(
                color: Color.fromRGBO(214, 52, 133, 1),
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

        Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 16),
            child: Text(
              ("Your blood sugar is ${this.result}"),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.0
              ),
            ),
            ),

        const Padding(
            padding: EdgeInsets.fromLTRB(25, 32, 25, 0),
            child: Text(
              "The result of this calculator is just an estimate based on minimal factors, consult a healthcare professional for accurate readings.",
              style: TextStyle(
                color: Color.fromRGBO(214, 52, 132, 100),
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