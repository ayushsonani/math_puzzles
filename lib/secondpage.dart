import 'dart:ui';

import 'package:ayush/datas.dart';
import 'package:ayush/win_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPageInApp extends StatefulWidget {
  int? inx;

  SecondPageInApp([this.inx]);

  @override
  State<SecondPageInApp> createState() => _SecondPageInAppState();
}

class _SecondPageInAppState extends State<SecondPageInApp> {
  List<String> vl = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<bool> t = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  bool Temp = false;
  bool temp2 = false;
  String Ans_prit = "";
  List<String> chake_ans = [
    "10",
    "20",
    "30",
    "40",
    "50",
    "60",
    "70",
    "80",
    "90",
    "100",
    "110",
    "120",
    "130",
    "140",
    "150",
    "160",
    "170",
    "180",
    "190",
    "200"
  ];

  // int x=0;

  get_prefs() async {
    data.prefs = await SharedPreferences.getInstance();
    if (widget.inx == null) {
      data.i = data.prefs?.getInt("I_value_store")! ?? 1;
      setState(() {});
    } else {
      data.i = widget.inx!;
      setState(() {});
    }

    // data.i =  data.prefs?.getInt("I_value_store")!?? 1;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_prefs();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("asset/images/gameplaybackground.jpg")),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            data.i++;
                            data.prefs?.setInt("I_value_store", data.i);

                            setState(() {});
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("asset/images/skip.png"))),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                    image: AssetImage(
                                        "asset/images/level_board.png"))),
                            alignment: Alignment.center,
                            child: Text("PUZZLE ${data.i}",
                                style: TextStyle(fontSize: 28)),
                          )),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("asset/images/hint.png"))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "asset/images/levals/p${data.i}.png"))),
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 1, color: Colors.blue)),
                                  padding: EdgeInsets.all(10),
                                  alignment: Alignment.centerLeft,
                                  child: Text("${Ans_prit}",
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      if (Ans_prit.isNotEmpty) {
                                        Ans_prit = Ans_prit.substring(
                                            0, Ans_prit.length - 1);
                                      }
                                      setState(() {});
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "asset/images/delete.png"))),
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTapDown: (details) {
                                    Temp = true;
                                    setState(() {});
                                  },
                                  onTapUp: (details) {
                                    Temp = false;
                                    setState(() {});

                                    if (chake_ans[data.i - 1] == Ans_prit) {
                                      data.tick.add("${(data.i-1).toString()}");
                                      data.i++;
                                      Ans_prit = "";

                                      // print("data x count =: ${data.xcount}");

                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return WinGame();
                                        },
                                      ));
                                      setState(() {});
                                    }
                                    else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong!!!"),duration: Duration(milliseconds: 1500),));
                                    }

                                    data.prefs?.setStringList("Tick_list", data.tick);
                                    data.prefs?.setInt("I_value_store", data.i);

                                    setState(() {});
                                  },
                                  onTapCancel: () {
                                    Temp = false;
                                    setState(() {});
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Temp
                                            ? Border.all(
                                                width: 3, color: Colors.white38)
                                            : null),
                                    child: Text("SUBMIT",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: GridView.builder(
                                    itemCount: vl.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 10,
                                            crossAxisSpacing: 2),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTapCancel: () {
                                          t[index] = false;
                                          setState(() {});
                                        },
                                        onTapUp: (details) {
                                          t[index] = false;
                                          setState(() {});

                                          Ans_prit = Ans_prit + vl[index];
                                          setState(() {});
                                        },
                                        onTapDown: (details) {
                                          t[index] = true;
                                          setState(() {});
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: t[index]
                                                ? Colors.white60
                                                : Colors.white12,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: t[index]
                                                ? Border.all(
                                                    width: 3,
                                                    color: Colors.white)
                                                : null,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text("${vl[index]}",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
