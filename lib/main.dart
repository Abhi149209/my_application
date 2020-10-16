import 'package:flutter/material.dart';
import 'news_card.dart';

void main() {
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String Value=null;

  TextEditingController controller;

  bool isNameValid = true;
  bool checkBoxValue =false;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('TODAYS', style: TextStyle(color: Colors.black54),),
            Text('News', style: TextStyle(color: Colors.red),),
          ],
        ),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: <Widget>[
            Center(
              child: TextField(
                onChanged: (text) {
                  Value = text;
                },

                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                decoration: InputDecoration(
                    hintText: 'Enter the Description ',

                    errorText: isNameValid ? null : "Invalid name"
                ),
                controller: controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Search Title Tag',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20.0,

                  ),
                ),
                Checkbox(
                  value:checkBoxValue,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      checkBoxValue=value;
                    });
                  },
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Search'),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen()));
                    controller.clear();
                  },
                ),
              ],


            ),
          ],
        ),
      ),

    );
  }
}