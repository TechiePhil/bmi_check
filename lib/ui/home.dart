import 'package:flutter/material.dart';

class BMIHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BMIHomeState();
  }
}

class BMIHomeState extends State<BMIHome> {
  String remark = '';
  int age;
  double height;
  double weight;
  double bmi = 0;
  
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  
  static const FEET = 3.2808;
  static const POUNDS = 2.205;
  
  void cleanAgeData(String value) {
    age = int.tryParse(value);
  }
  
  void cleanHeightData(String value) {
    height = double.tryParse(value);
  }
  void cleanWeightData(String value) {
    weight = double.tryParse(value);
  }
  
  void calculateBMI() {
    if (ageController.text.isNotEmpty && heightController.text.isNotEmpty &&
        weightController.text.isNotEmpty) {
      cleanHeightData(heightController.text);
      cleanWeightData(weightController.text);
      if (height > 0 && weight > 0) {
        // calculate BMI here!
        double inches = height * 12;
        setState(() {
          bmi = weight / (inches * inches) * 703;
          if (bmi < 18.5) {
            remark = 'Underweight';
          }
          else if (bmi >= 18.5 && bmi <= 25) {
            remark = 'Great shape!';
          }
          else if (bmi > 25 && bmi < 30) {
            remark = 'Overweight';
          }
          else if (bmi >= 30) {
            remark = 'Obese';
          }
          else {
            remark = '';
          }
        });
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI'
        ),
        backgroundColor: Colors.pinkAccent
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(left:5, right:5, top:1, bottom:1),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/bmilogo.png',
                  ),
                  Container(
                    padding: EdgeInsets.only(left:4, right:4, top:4, bottom:6),
                    color: Colors.grey[300],
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: ageController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.black)
                            // ),
                            // disabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.black),
                            // ),
                            icon: Icon(Icons.person_outline, color: Colors.black),
                            labelText: 'Age',
                            labelStyle: TextStyle(
                              color: Colors.black
                            )
                          ),
                          onChanged: cleanAgeData
                        ),
                        TextField(
                          controller: heightController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.black)
                            // ),
                            // disabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.black),
                            // ),
                            icon: Icon(Icons.insert_chart, color: Colors.black),
                            labelText: 'Height in feet',
                            labelStyle: TextStyle(
                              color: Colors.black
                            )
                          ),
                          onChanged: cleanHeightData
                        ),
                        TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            // enabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.black)
                            // ),
                            // disabledBorder: OutlineInputBorder(
                            //   borderSide: BorderSide(color: Colors.black)
                            // ),
                            icon: Icon(Icons.line_weight, color: Colors.black),
                            labelText: 'Weight in lbs',
                            labelStyle: TextStyle(
                              color: Colors.black
                            )
                          ),
                          onChanged: cleanWeightData
                        ),
                        Divider(height:10),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                          ),
                          child: Text(
                            'Calculate',
                            style: TextStyle(
                              color: Colors.white
                            )
                          ),
                          onPressed: calculateBMI
                        )
                      ]
                    )
                  )
                ]
              ),
              
              Container(
                padding: EdgeInsets.only(top:10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Your BMI: ${bmi.toStringAsFixed(2)}',
                      style: TextStyle(
                        // color: Colors.blueAccent,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      )
                    ),
                    Text(
                      remark,
                      style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ]
                )
              )
            ]
          )
        )
      )
    );
  }
}