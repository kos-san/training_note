import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_note/view/parts/training_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Color(0XFFE7E0EC),
          title: Text('筋トレ記録アプリ', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.all(6),
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0XFF6750A4),
                    shape: StadiumBorder(),
                    fixedSize: Size(85, 10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TrainingList()),
                    );
                  },
                  child: Text('一覧', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
              ),
            ),
          ],
        ),
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
              Card(
                color: Color(0XFFE7E0EC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      width: 180,
                      height: 40,
                      child: Center(
                        child: Text('総エクササイズ数', style: TextStyle(fontSize: 16),),
                      ),
                    ),
                    const SizedBox(
                      width: 180,
                      height: 40,
                      child: Center(
                        child: Text('232回', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Card(
                color: Color(0XFFE7E0EC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      width: 180,
                      height: 40,
                      child: Center(
                        child: Text('月平均', style: TextStyle(fontSize: 16),),
                      ),
                    ),
                    const SizedBox(
                      width: 180,
                      height: 40,
                      child: Center(
                        child: Text('19回', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Card(
            color: Color(0XFFE7E0EC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                const SizedBox(
                  width: 180,
                  height: 40,
                  child: Center(
                    child: Text('週平均', style: TextStyle(fontSize: 16),),
                  ),
                ),
                const SizedBox(
                  width: 180,
                  height: 40,
                  child: Center(
                    child: Text('4.5回', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
