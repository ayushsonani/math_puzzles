import 'package:ayush/datas.dart';
import 'package:ayush/secondpage.dart';
import 'package:flutter/material.dart';

class ThirdPages extends StatefulWidget {
  const ThirdPages({super.key});

  @override
  State<ThirdPages> createState() => _ThirdPagesState();
}

class _ThirdPagesState extends State<ThirdPages> {
  Get_i_value() {
    data.i = data.prefs?.getInt("I_value_store") ?? 1;
    data.chach = data.prefs!.getStringList("Tick_list")?? [] ;
    for (int j = 0; j <= data.i - 1; j++) {
      data.con[j] = true;
    }
    int k=0;
    int j=0;

    if(data.chach.isNotEmpty){
      for(j=0; j<data.chach.length; j++){
        for(k=0; k<=data.i-1; k++){
          // print("data chack:= ${data.chach[j]}");
          if(data.chach[j] == k.toString()) {
            print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
            print("data chack:= ${data.chach[j]}");
            data.cout_tice[k] = true;
          }

        }
      }
    }


    // print("List of tick := ${data.prefs?.getStringList("Tick_list")}");
    // print("List of coun_tick := ${data.cout_tice}");
    // print("chach : = ${data.chach}");

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get_i_value();
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
              fit: BoxFit.fill,
              image: AssetImage("asset/images/background.jpg")),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: Text(
                  "Math Levels",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontStyle: FontStyle.italic),
                ))),
            Expanded(
              flex: 9,
              child: GridView.builder(
                itemCount: 28,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return (data.con[index])
                      ? (data.cout_tice[index])
                          ? tick(index)
                          : number(index)
                      : lock();
                },
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget lock() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("asset/images/lock.png"))),
    );
  }

  Widget number(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return SecondPageInApp(index + 1);
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 3),
            borderRadius: BorderRadius.circular(20)),
        alignment: Alignment.center,
        child: Text("${index + 1}",
            style: TextStyle(fontSize: 30, fontFamily: "AppFonts")),
      ),
    );
  }

  Widget tick(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return SecondPageInApp(index + 1);
          },
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("asset/images/tick.png"))),
        alignment: Alignment.center,
        child: Text("${index + 1}",
            style: TextStyle(fontSize: 30, fontFamily: "AppFonts")),
      ),
    );
  }
}
