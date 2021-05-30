import 'package:flutter/material.dart';

import 'calculation.dart';

class MyWidgets {
  static void myDialog(
      BuildContext context, String title, String message, double margin) {
    showDialog(
      context: context,
      barrierColor: Colors.black45,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Center(
              child: new Text(title,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ))),
          content: Container(
              margin: EdgeInsets.only(left: margin),
              padding: EdgeInsets.only(top: 20),
              child: new Text(message,
                  style: TextStyle(
                    color: Colors.blueGrey.shade900,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ))),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new ElevatedButton(
                  child: new Text("OK"),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade600,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class Format extends StatelessWidget {
  final int num;
  final String name;
  Format(this.num, this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 45,
                ),
                child: Text("$num",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blueGrey.shade900)),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: name == 'gpa'
                      ? GPA_Calculation.hours[num] > 9
                          ? 105
                          : 110
                      : CGPA_Calculation.cHours[num] > 9
                          ? 105
                          : 110,
                ),
                child: Text(
                    name == 'cgpa'
                        ? CGPA_Calculation.cHours[num].toString()
                        : GPA_Calculation.hours[num].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blueGrey.shade900)),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: name == 'gpa'
                      ? GPA_Calculation.grades[num] > 9 &&
                              GPA_Calculation.hours[num] < 10
                          ? 95
                          : GPA_Calculation.grades[num] < 10 &&
                                  GPA_Calculation.hours[num] > 9
                              ? 93
                              : GPA_Calculation.grades[num] > 9 &&
                                      GPA_Calculation.hours[num] > 9
                                  ? 88
                                  : 100
                      : CGPA_Calculation.gpas[num] > 9 &&
                              CGPA_Calculation.cHours[num] < 10
                          ? 95
                          : CGPA_Calculation.gpas[num] < 10 &&
                                  CGPA_Calculation.cHours[num] > 9
                              ? 93
                              : CGPA_Calculation.gpas[num] > 9 &&
                                      CGPA_Calculation.cHours[num] > 9
                                  ? 88
                                  : 100,
                ),
                child: Text(
                    name == 'cgpa'
                        ? CGPA_Calculation.gpas[num].toString()
                        : GPA_Calculation.grades[num].toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blueGrey.shade900)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
