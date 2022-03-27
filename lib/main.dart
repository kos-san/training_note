import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:training_note/view/parts/navigation_bar.dart';
import 'package:training_note/view/test_view_page.dart';
import 'package:training_note/view/parts/home_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('筋トレ記録アプリ'),
      ),
      body: HomePage(),
      bottomNavigationBar: NavBar.bottomNavigationBar(),
      );
  }
}