import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_note/main.dart';

class TrainingList extends StatefulWidget {
  @override
  _TrainingListState createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  final items = List<String>.generate(20, (i) => "2021/04/$i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Color(0XFFE7E0EC),
        title: Text('一覧', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0XFF6750A4),
                  shape: StadiumBorder(),
                  fixedSize: Size(110, 10),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MyHomePage(title: 'aaa',)),
                  );
                },
                child: Text('カレンダー', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
            itemBuilder: (context, index) {
             return InkWell(
               onTap: () async {
                 await showDialog(
                   context: context,
                   builder: (context) {
                     return StatefulBuilder(
                         builder: (context, setState) {
                           return SimpleDialog(
                             backgroundColor: Colors.black,
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.all(Radius.circular(10.0))
                             ),
                               contentPadding: EdgeInsets.all(0.0),
                               titlePadding: EdgeInsets.all(0.0),
                               title: Container(
                                 height: 400,
                                 child: Scaffold(
                                   body: Center(child: Text('${items[index]}', style: TextStyle(fontSize: 40.0),)),
                                 ),
                               )
                           );
                         }
                     );
                   },
                 );
               },
               child: Card(
                 margin: const EdgeInsets.all(20.0),
                 child: Container(
                     margin: const EdgeInsets.all(10.0),
                     width: 300,
                     height: 100,
                     child: Text(
                       '${items[index]}',
                       style: TextStyle(fontSize: 24),
                     )
                 ),
               ),
             );
            },
        ),
      )
    );
  }
}