import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'about.dart';
import 'calculation.dart';
import 'myWidgets.dart';

class CGPA extends StatefulWidget {
  @override
  _CGPAState createState() => _CGPAState();
}

class _CGPAState extends State<CGPA> {
  bool check = false;
  double _result = 0;
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

  void clearText() {
    fieldText1.clear();
    fieldText2.clear();
  }

  Widget checkFun(int num) {
    if (check) {
      return Format(num, 'cgpa');
    }

    CGPA_Calculation.gpa = 0;
    CGPA_Calculation.cHr = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              margin: EdgeInsets.only(left: 35),
              child: Text("CGPA Calculator")),
          backgroundColor: Colors.blueGrey.shade700,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                      gradient: new LinearGradient(
                          colors: [
                            Colors.blueGrey.shade600,
                            Colors.blueGrey.shade500,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(0.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                      borderRadius: new BorderRadius.only(
                          bottomLeft: const Radius.circular(15.0),
                          bottomRight: const Radius.circular(15.0))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text("Add Total Credit Hours And GPA Of Each Semester",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white70)),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("Total CreditHours: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white)),
                          ),
                          SizedBox(
                            width: 95,
                          ),
                          Container(
                            width: 50,
                            child: TextField(
                              onChanged: (text) {
                                CGPA_Calculation.cHr = double.parse(text);
                              },
                              autofocus: true,
                              controller: fieldText1,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueGrey.shade900),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.blueGrey.shade200),
                                  hintText: "0.0"),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.allow(RegExp(
                                    '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$'))
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("GPA: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white)),
                          ),
                          SizedBox(
                            width: 215,
                          ),
                          Container(
                            width: 50,
                            child: TextField(
                              onChanged: (text) {
                                CGPA_Calculation.gpa = double.parse(text);
                              },
                              controller: fieldText2,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blueGrey.shade900),
                                  ),
                                  hintStyle: TextStyle(
                                      color: Colors.blueGrey.shade200),
                                  hintText: "0.0"),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              inputFormatters: <TextInputFormatter>[
                                LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.allow(RegExp(
                                    '^\$|^(0|([1-9][0-9]{0,}))(\\.[0-9]{0,})?\$'))
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Builder(builder: (context) {
                        return ElevatedButton(
                          onPressed: () => {
                            setState(() {
                              if (CGPA_Calculation.cHr == 0 ||
                                  CGPA_Calculation.gpa == 0) {
                                MyWidgets.myDialog(context, 'OOPS',
                                    'Add Both Values First', 45);
                              } else {
                                check = true;

                                CGPA_Calculation.cHours
                                    .add(CGPA_Calculation.cHr);
                                CGPA_Calculation.gpas.add(CGPA_Calculation.gpa);

                                CGPA_Calculation.cHr = 0;
                                CGPA_Calculation.gpa = 0;
                                clearText();
                              }
                              if (CGPA_Calculation.cHours.length > 1 &&
                                  CGPA_Calculation.gpas.length > 1 &&
                                  CGPA_Calculation.gpas.length ==
                                      CGPA_Calculation.cHours.length) {
                                _result = CGPA_Calculation.result();
                              }
                            })
                          },
                          child: Text("Add"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.blueGrey.shade900,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text("Semester",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.blueGrey.shade900)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 60),
                      child: Text("C Hr.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.blueGrey.shade900)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 85),
                      child: Text("GPA",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.blueGrey.shade900)),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    for (var i = 0; i < CGPA_Calculation.cHours.length - 1; i++)
                      Container(child: checkFun(i + 1))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: AnimatedContainer(
          height: 40,
          duration: Duration(seconds: 1),
          color: _result >= 3.5
                  ? Colors.green
                  : _result < 3.5 && _result >= 2.8
                      ? Colors.yellow
                      : _result < 2.8 && _result >= 2.5
                          ? Colors.orange
                          : _result < 2.5 && _result >= 0.1
                          ? Colors.red
                          : Colors.blueGrey.shade600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("CGPA:",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white)),
              Text(_result.toStringAsFixed(2),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Colors.white)),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade600,
                ),
                child: Text("",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white)),
              ),
              Builder(builder: (context) {
                return ListTile(
                  title: Text('GPA Calculator',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Colors.blueGrey.shade900)),
                  onTap: () {
                    CGPA_Calculation.gpas.clear();
                    CGPA_Calculation.cHours.clear();
                    CGPA_Calculation.gpas.add(0.0);
                    CGPA_Calculation.cHours.add(0.0);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                );
              }),
              Builder(builder: (context) {
                return ListTile(
                  title: Text('CGPA Calculator',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Colors.blueGrey.shade900)),
                  onTap: () {
                    Navigator.pop(context);
                  },
                );
              }),
              Builder(builder: (context) {
                return ListTile(
                  title: Text('About',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                          color: Colors.blueGrey.shade900)),
                  onTap: () {
                    CGPA_Calculation.gpas.clear();
                    CGPA_Calculation.cHours.clear();
                    CGPA_Calculation.gpas.add(0.0);
                    CGPA_Calculation.cHours.add(0.0);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About()),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
