import 'package:ayush/datas.dart';
import 'package:ayush/secondpage.dart';
import 'package:ayush/thirdpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: MathPuzzlesFirstPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MathPuzzlesFirstPage extends StatefulWidget {
  const MathPuzzlesFirstPage({super.key});
// static SharedPreferences prefs ;

  @override
  State<MathPuzzlesFirstPage> createState() => _MathPuzzlesFirstPageState();
}

class _MathPuzzlesFirstPageState extends State<MathPuzzlesFirstPage> {

 List temp = [false,false,false];

 get_i() async {
   data.prefs = await SharedPreferences.getInstance();
   data.i = data.prefs?.getInt("I_value_store")! ?? 1;
   setState(() {

   });

 }

 @override
  void initState() {
    // TODO: implement initState
    super.initState();

    get_i();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.fill,
                image: AssetImage("asset/images/background.jpg"))),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Math Puzzles",
                    style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 30, color: Colors.indigo),
                  )),
            ),
            Expanded(
              flex: 8,
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            "asset/images/blackboard_main_menu.png"))),
                child: Container(
                  margin: EdgeInsets.only(left: 80,right: 80,top: 130,bottom: 130),
                  // color: Colors.white,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTapUp: (details) {
                          temp[0] = false;
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return SecondPageInApp();
                          },));
                          setState(() {

                          });
                        },
                        onTapDown: (details) {
                          temp[0] = true;
                          setState(() {

                          });


                        },
                        onTapCancel: () {
                          temp[0] = false;
                          setState(() {

                          });
                        },
                        child: Container(
                          
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: temp[0]?BorderRadius.circular(15):null,
                            border: temp[0]?Border.all(width: 3,color: Colors.white38):null,
                          ),
                          alignment: Alignment.center,
                          child: Text("CONTINUE",style: TextStyle(fontFamily: "AppFonts",fontSize: 28,color: Colors.white)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTapUp: (details) {
                          temp[1] = false;
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return ThirdPages();
                          },));
                          setState(() {

                          });
                        },
                        onTapDown: (details) {
                          temp[1] = true;
                          setState(() {

                          });


                        },
                        onTapCancel: () {
                          temp[1] = false;
                          setState(() {

                          });
                        },
                        child: Container(

                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: temp[1]?BorderRadius.circular(15):null,
                            border: temp[1]?Border.all(width: 3,color: Colors.white38):null,
                          ),
                          alignment: Alignment.center,
                          child: Text("PUZZLE",style: TextStyle(fontFamily: "AppFonts",fontSize: 28,color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("AD",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.indigo)),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Container(
                              // margin: EdgeInsets.all(5),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      // fit: BoxFit.fill,
                                      image: AssetImage(
                                          "asset/images/ltlicon.png"))),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 5,child: Container()),
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(1),
                                  alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                     image: DecorationImage(
                                       image: AssetImage("asset/images/shareus.png")
                                     )
                                   ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(1),

                                  alignment: Alignment.center,
                                   decoration: BoxDecoration(
                                     image: DecorationImage(
                                       image: AssetImage("asset/images/emailus.png")
                                     )
                                   ),
                                ),
                              ),
                            ],),
                          ),
                          Expanded(

                            child: Container(
                              margin: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1)
                              ),
                              alignment: Alignment.center,
                              child: Text("Privacy Policy",style: TextStyle(fontSize: 20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
