import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'main.dart';
import 'CGPA_Page.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              margin: EdgeInsets.only(left: 60), 
              child: Text("About Me")),
          backgroundColor: Colors.blueGrey.shade700,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
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
                  child: Center(
                    child: Text(
                            "HI!",
                            style: TextStyle(fontSize: 150, color: Colors.white),
                          ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  child: Row(
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            text:
                                '\n\n\t\t\t\t\t\tI Am ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Bilal Ahmed.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.blueGrey.shade600,
                                  )),
                              TextSpan(
                                  text:
                                      ' A 19 Years Old Pakistani Boy Who Enjoys Coding.\n\n\t\t\t\t\t\tThis App Is The Result Of One Of My Self-Learning Projects, I Hope It Comes In Handy For You!'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: InkWell(
                    child: Image.asset(
                      'assets/images/fb.png',
                      width: 70,
                    ),
                    onTap: () =>
                        launch("https://www.facebook.com/bilalahmed0157")),
              ),
              Container(
                child: InkWell(
                    child: Image.asset(
                      'assets/images/insta.png',
                      width: 38,
                      fit: BoxFit.contain,
                    ),
                    onTap: () => launch(
                        "https://www.instagram.com/bilalahmedsiddiquii/")),
              ),
              Container(
                child: InkWell(
                    child: Image.asset(
                      'assets/images/linkedin.png',
                      width: 70,
                      fit: BoxFit.contain,
                    ),
                    onTap: () => launch(
                        "https://www.linkedin.com/in/bilal-ahmed-001a5a20a")),
              ),
              Container(
                child: InkWell(
                    child: Image.asset(
                      'assets/images/github.png',
                      width: 42,
                      fit: BoxFit.contain,
                    ),
                    onTap: () =>
                        launch("https://github.com/Bilal-Ahmed-Siddiqui")),
              ),
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
                    Navigator.pop(context);
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
