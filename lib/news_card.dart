
import 'package:flutter/material.dart';
import 'api_caliing.dart';
class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {


  List<dynamic> data=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:Text(
            'Search Results',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 25.0,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body:ListViewBuilder(),

      ),
     );

  }
}

class ListViewBuilder extends StatefulWidget {
  @override
  _ListViewBuilderState createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
  List<Users> data=[];

  Future<List<Users>> asyncronus() async {
    data=await WeatherModel().getCityWeather();
    return data;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text("ListView.builder")
      ),
      body: FutureBuilder(
        future: asyncronus(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data==null) {
            return Container(
              child: Center(
                child: Text('loading.....'),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  subtitle: Text('printnai hua '),
                  title: Text(snapshot.data[index].id),
                );
              },

            );
          }
        },
      ),
    );
  }
}