import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:training_note/view/parts/add_training_details.dart';
import 'package:training_note/view/parts/training_list.dart';
import 'package:training_note/view/parts/home_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  initializeDateFormatting('ja').then((_) => runApp(const MyApp()));
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
      // home: const TestViewPage(),
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

  var _selectedIndex = 0;

  var _pages = <Widget>[
    HomePage(),
    AddTrainingDetails(),
    TrainingList(),
  ];

  void _onTapItem(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        screens: _pages,
        items: [
          PersistentBottomNavBarItem(
            icon: Icon(Icons.home),
            activeColorPrimary: Color(0XFF6750A4),
            title: ("Home")
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.add),
            activeColorPrimary: Color(0XFF6750A4),
            activeColorSecondary: Colors.white,
            title: ("Add")
          ),
          PersistentBottomNavBarItem(
            icon: Icon(Icons.settings),
            activeColorPrimary: Color(0XFF6750A4),
            title: ("Settings")
          )
        ],
        backgroundColor: Color(0XFFE7E0EC),
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}