import 'dart:async';

import 'package:flutter/material.dart';

import 'badge_icon.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> _countController = StreamController<int>();

  int _currentIndex = 0;
  int _tabBarCount = 0;

  List<Widget> _pages;

  Widget _tabBar() {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 25),
          title: const Text("Increment"),
        ),
        BottomNavigationBarItem(
          icon: StreamBuilder(
            initialData: _tabBarCount,
            stream: _countController.stream,
            builder: (_, snapshot) => BadgeIcon(
              icon: Icon(Icons.chat, size: 25),
              badgeCount: snapshot.data,
            ),
          ),
          title: const Text("Decrement"),
        ),
      ],
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }

  @override
  void initState() {
    _pages = [
      Container(
        child: Center(
          child: FlatButton(
            child: Text('Increment'),
            onPressed: () {
              _tabBarCount = _tabBarCount + 1;
              _countController.sink.add(_tabBarCount);
            },
          ),
        ),
      ),
      Container(
        child: Center(
          child: FlatButton(
            child: Text('Decrement'),
            onPressed: () {
              _tabBarCount = _tabBarCount - 1;
              _countController.sink.add(_tabBarCount);
            },
          ),
        ),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar Icon Badge'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: _tabBar(),
    );
  }

  @override
  void dispose() {
    _countController.close();
    super.dispose();
  }
}
