import 'package:ayush/secondpage.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class WinGame extends StatefulWidget {
  const WinGame({super.key});

  @override
  State<WinGame> createState() => _WinGameState();
}

class _WinGameState extends State<WinGame> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("asset/images/background.jpg")),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text("PUZZLE 1 COMPLETED",
                      style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic, color: Colors.indigo)),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/images/trophy.png"))),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: 250,
                  height: 250,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return SecondPageInApp();
                              },
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF444141),
                                  Colors.white,
                                  Color(0xFF444141)
                                ]),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(width: 1)),
                            alignment: Alignment.center,
                            child: Text("CONTINUE",
                                style: TextStyle(
                                    fontSize: 25, fontStyle: FontStyle.italic)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap:() {
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return MathPuzzlesFirstPage();
                            },));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Color(0xFF444141),
                                  Colors.white,
                                  Color(0xFF444141)
                                ]),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(width: 1)),
                            alignment: Alignment.center,
                            child: Text("MAIN MENU",
                                style: TextStyle(
                                    fontSize: 25, fontStyle: FontStyle.italic)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xFF444141),
                                Colors.white,
                                Color(0xFF444141)
                              ]),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 1)),
                          alignment: Alignment.center,
                          child: Text("BUY PRO",
                              style: TextStyle(
                                  fontSize: 25, fontStyle: FontStyle.italic)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text("SHARE THIS PUZZLE",
                        style: TextStyle(fontSize: 30, color: Colors.indigo)),
                  )),
              Expanded(
                flex: 1,
                child: Container(decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/images/shareus.png")
                  )
                ),),
              ),
              Expanded(flex: 3,child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
