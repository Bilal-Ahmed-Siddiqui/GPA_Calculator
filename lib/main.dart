import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'about.dart';
import 'calculation.dart';
import 'myWidgets.dart';
import 'CGPA_Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  double result = 0.00;
  bool check = false;
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

  void clearText() {
    fieldText1.clear();
    fieldText2.clear();
  }

  Widget checkFun(int num) {
    if (check) {
      return Format(num, 'gpa');
    }

    GPA_Calculation.gp = 0;
    GPA_Calculation.cHr = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Container(
                  margin: EdgeInsets.only(left: 45),
                  child: Text("GPA Calculator")),
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
                          Text(
                              "Add Credit Hours And Grade Points Of Each Course",
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
                                child: Text("Credit Hours: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Colors.white)),
                              ),
                              SizedBox(
                                width: 137,
                              ),
                              Container(
                                width: 50,
                                child: TextField(
                                  onChanged: (text) {
                                    GPA_Calculation.cHr = double.parse(text);
                                  },
                                  controller: fieldText1,
                                  autofocus: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
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
                                child: Text("Grade Points: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Colors.white)),
                              ),
                              SizedBox(
                                width: 135,
                              ),
                              Container(
                                width: 50,
                                child: TextField(
                                  onChanged: (text) {
                                    GPA_Calculation.gp = double.parse(text);
                                  },
                                  controller: fieldText2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
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
                                  if (GPA_Calculation.cHr == 0 ||
                                      GPA_Calculation.gp == 0) {
                                    MyWidgets.myDialog(context, 'OOPS',
                                        'Add Both Values First', 45);
                                    print("1");
                                  } else {
                                    check = true;
                                    print("2");

                                    GPA_Calculation.hours
                                        .add(GPA_Calculation.cHr);
                                    GPA_Calculation.grades
                                        .add(GPA_Calculation.gp);

                                    GPA_Calculation.cHr = 0;
                                    GPA_Calculation.gp = 0;
                                    clearText();
                                  }

                                  if (GPA_Calculation.grades.length > 1 &&
                                      GPA_Calculation.hours.length > 1 &&
                                      GPA_Calculation.grades.length ==
                                          GPA_Calculation.hours.length) {
                                    result = GPA_Calculation.result();
                                    print("3");
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
                          child: Text("Course",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.blueGrey.shade900)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 80),
                          child: Text("C Hr.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.blueGrey.shade900)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 95),
                          child: Text("GP",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.blueGrey.shade900)),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        for (var i = 0;
                            i < GPA_Calculation.hours.length - 1;
                            i++)
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
              color: result >= 3.5
                  ? Colors.green
                  : result < 3.5 && result >= 2.8
                      ? Colors.yellow
                      : result < 2.8 && result >= 2.5
                          ? Colors.orange
                          : result < 2.5 && result >= 0.1
                          ? Colors.red
                          : Colors.blueGrey.shade600,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("GPA:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Colors.white)),
                  Text(result.toStringAsFixed(2),
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
                        Navigator.pop(context);
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
                        GPA_Calculation.grades.clear();
                        GPA_Calculation.hours.clear();
                        GPA_Calculation.grades.add(0.0);
                        GPA_Calculation.hours.add(0.0);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CGPA()),
                        );
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
                        GPA_Calculation.grades.clear();
                        GPA_Calculation.hours.clear();
                        GPA_Calculation.grades.add(0.0);
                        GPA_Calculation.hours.add(0.0);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About()),
                        );
                      },
                    );
                  }),
                ],
              ),
            )));
  }
}
