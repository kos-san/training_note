import 'package:flutter/material.dart';
//  testtest

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '筋トレ記録アプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  List<BottomNavigationBarItem> bottomNavBarItems() {
    return[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'HOME',
      ),
      const BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '記録',
      ),
      const BottomNavigationBarItem(
          icon: Icon(Icons.health_and_safety_sharp),
          label: '体重',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: '設定',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many tssidmes:',
            ),
            const Text(
              'aa',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomNavBarItems(),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
