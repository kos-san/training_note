import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('カレンダー'),
          TableCalendar(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 1, 1),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  '合計トレーニング数',
                  style: TextStyle(
                    fontSize: 20,
                  ),
              ),
              Text(
                  '〇〇日',
                style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){
                print('本日のトレーニングを追加');
              },
              child: Text('本日のトレーニングを追加'),
          ),
        ],
      )
    );
  }
}
