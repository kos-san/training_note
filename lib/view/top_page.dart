import 'package:flutter/material.dart';
import 'package:training_note/view/parts/navigation_bar.dart';

class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  _TopPageState createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TopPage"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many tssidmes:',
              ),
              Text(
                'aa',
              ),
              Text("TopPage"),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar.bottomNavigationBar()
    );
  }
}
