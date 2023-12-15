import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'database/datas.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dic =await getApplicationDocumentsDirectory();
  Hive.init(dic.path);
  Hive.registerAdapter(dataAdapter());
  Hive.openBox("contects");
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: FirstPage(),));
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  
  TextEditingController nam = TextEditingController();
  TextEditingController num = TextEditingController();
  // get_box() async {
  //   Box box = await Hive.box("contects");
  //   for(int i=0; i<box.length; i++){
  //     if(box.getAt(i).name==""&&box.getAt(i).number==""){
  //       // box.deleteAt(i);
  //     }
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
// get_box();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:FutureBuilder(
        future: Hive.openBox("contects"),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done){
            return ListView.builder(itemCount: snapshot.data?.length,itemBuilder: (context, index) {
              return ListTile(title: Text("${snapshot.data?.getAt(index).name}"),subtitle: Text("${snapshot.data?.getAt(index).number}"),);
            },);
          }
          else{
            return Center(child: CircularProgressIndicator());
          }

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Box box = await Hive.box("contects");

          // ignore: use_build_context_synchronously
          showDialog(context: context, builder:(context) {
            return AlertDialog(
              title: Text("add contect number "),
              actions: [
                ElevatedButton(onPressed: () {
                  data dat = data("${nam.text}", "${num.text}");

                  if(nam.text!=""&&num.text!=""){
                  box.add(dat);
                  }

                  nam.clear();
                  num.clear();
                  print(box.length);
                  setState(() {

                  });
                  Navigator.pop(context);
                }, child: Text("Add"))
              ],
              content: ListView(
                children: [
                  TextField(
                    controller: nam,
                    decoration: InputDecoration(
                      hintText: "enter a name ",
                    ),
                  ),
                  TextField(
                    controller: num,
                    decoration: InputDecoration(
                      hintText: "enter a number ",
                    ),
                  )
                ],
              ),
            );
          }, );
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
