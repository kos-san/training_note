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
              SizedBox(width: 20),
              Text(
                // 合計トレーニング数を表示する
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
              },
              child: Text('トレーニングを追加する'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 20,
                ),
                textStyle: TextStyle(
                  fontSize: 16,
                )
              ),
          ),
        ],
      )
    );
  }
}
