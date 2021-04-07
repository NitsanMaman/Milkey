import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  final myApp = MyApp();
  myApp._myHomePage._myHomePageState._serverStuff();
  runApp(myApp);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _myHomePage = MyHomePage(
    title: 'a',
  );
  MyHomePage get() => _myHomePage;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ':]',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: _myHomePage,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final _myHomePageState = _MyHomePageState();
  _MyHomePageState get() => _myHomePageState;

  @override
  _MyHomePageState createState() => _myHomePageState;
}

class Player {
  final String name;
  final String ip;
  Player(this.name, this.ip);
  Player.fromJson(Map<String, dynamic> json) : this(json['name'], json['ip']);
  Map<String, dynamic> toJson(Player player) => {'name': name, 'ip': ip};
}

class _MyHomePageState extends State<MyHomePage> {
  var _string = "Rock";
  double _counter = 0.5;
  var obj = {"name": "hi", "ip": "10.0.0.1"};
  Set<Player> _players = {
    Player.fromJson({"name": "hey", "ip": "192.168.0.101"}),
    Player.fromJson({"name": "heya", "ip": "192.168.0.102"})
  };
  Set<String> _player_names = {};
  bool _stop = false;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter += 15.5;
      _string = WordPair.random().first;
    });
  }

  void _doStuff(int hey) {
    if (hey == 0) {
      _incrementCounter();
    } else {
      setState(() {
        _counter = 0;
      });
    }
  }

  void handleRequest(dynamic request) {}

  void getConnectedPlayers() async {}

  void _serverStuff() async {
    while (!_stop) {
      getConnectedPlayers();
      sleep(Duration(seconds: 5));
    }
  }

  void stop() {
    _stop = true;
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_players_names'),
            Text(
              '$_string',
              textScaleFactor: 2,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
              textScaleFactor: 3,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(
          Icons.beach_access,
          color: Colors.blueGrey.shade700,
        ),
        hoverColor: Color(Colors.red.value),
        splashColor: Color(Colors.white.value),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.amber.shade50,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(label: 'zeus', icon: Icon(Icons.gamepad)),
          BottomNavigationBarItem(label: 'hey', icon: Icon(Icons.ac_unit))
        ],
        onTap: _doStuff,
        selectedFontSize: 30,
      ),
    );
  }
}
