import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:aplikasicurs/CursModel.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curs',
      home: HomePage(title: "KURS"),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CursModel _cursModel;

  @override
  void initState() {
    super.initState();
    _cursModel = CursModel();
  }

  Future _onTap() async {
    var client = http.Client();
    try {
      var param = {"base": "USD"};
      var uri = Uri.https('api.ratesapi.io', '/api/latest', param);
      var uriReseponse = await client.get(uri);
      setState(() {
        _cursModel =
            CursModel.fromJson(json.decode(uriReseponse.body.toString()));
      });
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.title),
              backgroundColor: Colors.blue[500],
            ),
            backgroundColor: Colors.blue[900],
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: 70,
                    child: Center(
                      child: Image(
                        width: 70,
                        image: AssetImage('images/us.png'),
                      ),
                    )),
                Container(
                    width: 70,
                    height: 50,
                    child: Center(
                      child: Text(
                        "1 USD",
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
                Card(
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 80,
                          child: Center(
                            child: Image(
                              width: 50,
                              image: AssetImage('images/id.png'),
                            ),
                          )),
                      Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              " IDR ",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
                            ),
                          )),
                      Expanded(
                          child: Center(
                        child: Text(
                          _cursModel?.rates?.idr.toString(),
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 80,
                          child: Center(
                            child: Image(
                              width: 50,
                              image: AssetImage('images/sg.png'),
                            ),
                          )),
                      Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              "SGD",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
                            ),
                          )),
                      Expanded(
                          child: Center(
                        child: Text(
                          _cursModel?.rates?.sgd.toString(),
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 80,
                          child: Center(
                            child: Image(
                              width: 50,
                              image: AssetImage('images/jp.png'),
                            ),
                          )),
                      Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              "JPY",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
                            ),
                          )),
                      Expanded(
                          child: Center(
                        child: Text(
                          _cursModel?.rates?.jpy.toString(),
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 80,
                          child: Center(
                            child: Image(
                              width: 50,
                              image: AssetImage('images/eur.png'),
                            ),
                          )),
                      Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              "EUR",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
                            ),
                          )),
                      Expanded(
                          child: Center(
                        child: Text(
                          _cursModel?.rates?.eur.toString(),
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                ),
                Card(
                  color: Colors.white70,
                  child: Row(
                    children: <Widget>[
                      Container(
                          width: 80,
                          child: Center(
                            child: Image(
                              width: 50,
                              image: AssetImage('images/aus.png'),
                            ),
                          )),
                      Container(
                          width: 80,
                          height: 80,
                          child: Center(
                            child: Text(
                              "AUD",
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 18),
                            ),
                          )),
                      Expanded(
                          child: Center(
                        child: Text(
                          _cursModel?.rates?.aud.toString(),
                          style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                    ],
                  ),
                ),
                ElevatedButton(onPressed: _onTap, child: Text('DAPATKAN KURS'))
              ],
            ),
          ),
        )
      ],
    );
  }
}
