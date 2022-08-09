import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:training_note/view/parts/training_list.dart';

Map<DateTime, List> eventsList = {};

void testFunction(){
  if(eventsList.isNotEmpty){
    eventsList = {};
  }
  int i;
  for(i = 0; i < test.length; i++){
    DateTime day = test[i][0]["date"];
    if(!eventsList.containsKey(day)){
        eventsList[day] = [i];
      } else {
      eventsList[day]!.add(i);
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  DateTime _focusedDay = DateTime.now();

  int getHashCode(DateTime key){
    return key.day * 100000 + key.month * 10000 + key.year;
  }

  @override
  void initState(){
    super.initState();
    _selectedDay = _focusedDay;
      // int i;
      // for(i = 0; i < test.length; i++){
      //   DateTime day = test[i][0]["date"];
      //   if(!eventsList.containsKey(day)){
      //     eventsList[day] = [i];
      //   } else if(eventsList.length == 0) {
      //     break;
      //   } else {
      //     eventsList[day]!.add(i);
      //   }
      // }
    testFunction();
  }



  @override
  Widget build(BuildContext context) {

    final _events = LinkedHashMap<DateTime, List>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(eventsList);

    List getEventForDay(DateTime day){
      return _events[day] ?? [];
    }

    Widget _buildEventsMarker(DateTime date, List events) {
      return Positioned(
        right: 5,
        bottom: 5,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red[300],
          ),
          width: 16.0,
          height: 16.0,
          child: Center(
            child: Text(
              '${events.length}',
              style: TextStyle().copyWith(
                color: Colors.white,
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      );
    }

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
              locale: 'ja_JP',
              focusedDay: _focusedDay,
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 1, 1),
              eventLoader: getEventForDay,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true
              ),
              calendarFormat: _calendarFormat,
              onFormatChanged: (format){
                if(_calendarFormat != format){
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              selectedDayPredicate: (day){
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay){
                if(!isSameDay(_selectedDay, selectedDay)){
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
                print(_focusedDay);
              },
              onPageChanged: (focusedDay){
                _focusedDay = focusedDay;
              },
              calendarBuilders: CalendarBuilders(
                markerBuilder: (context, date, events){
                  if (events.isNotEmpty){
                    return _buildEventsMarker(date, events);
                  }
                }
              ),
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
