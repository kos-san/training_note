import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_note/main.dart';

class TrainingList extends StatefulWidget {
  @override
  _TrainingListState createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  final items = List<String>.generate(20, (i) => "2021/04/$i");
  var _modal_items = {'one': {'training_name': 'ベンチプレス'}, 'two': {'training_name': 'インクラインダンベルプレス'}};
  var _numbers = <String, String>{
    'one': 'イチ',
    'two': 'ニ',
    'three': 'サン',
  };

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
                               insetPadding: EdgeInsets.all(8),
                               backgroundColor: Color(0XFFE7E0EC),
                               shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0))
                               ),
                               contentPadding: EdgeInsets.all(0.0),
                               titlePadding: EdgeInsets.all(0.0),
                               title: Container(
                                 padding: EdgeInsets.all(10),
                                 decoration: BoxDecoration(
                                     color: Color(0XFFE7E0EC),
                                     borderRadius: BorderRadius.circular(10),
                                 ),
                                 // height: 400,
                                 child: Column(
                                   children: [
                                     Row(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         IconButton(
                                             padding: EdgeInsets.all(0.0),
                                             constraints: BoxConstraints(),
                                             onPressed: ()=> {
                                               Navigator.of(context).pop()
                                             },
                                             icon: Icon(Icons.clear)
                                         ),
                                         Text('${items[index]}'),
                                         IconButton(
                                             onPressed: () async {
                                               await showDialog(
                                                   context: context,
                                                   builder: (context) {
                                                     return StatefulBuilder(
                                                         builder: (context, setState) {
                                                           return SimpleDialog(
                                                             insetPadding: EdgeInsets.all(8),
                                                             backgroundColor: Color(0XFFE7E0EC),
                                                             shape: RoundedRectangleBorder(
                                                                 borderRadius: BorderRadius.all(Radius.circular(10.0))
                                                             ),
                                                             contentPadding: EdgeInsets.all(0.0),
                                                             titlePadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                             title: Container(
                                                               height: 100,
                                                               width: 80,
                                                               child: Column(
                                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                                 crossAxisAlignment: CrossAxisAlignment.center,
                                                                 children: [
                                                                   Row(
                                                                     children: [
                                                                       Icon(Icons.mode_edit, color: Color(0XFF6750A4)),
                                                                       Text('ワークアウトを編集')
                                                                     ],
                                                                   ),
                                                                   SizedBox(height: 15),
                                                                   Row(
                                                                     children: [
                                                                       Icon(Icons.clear, color: Colors.red),
                                                                       Text('削除')
                                                                     ],
                                                                   ),
                                                                 ],
                                                               ),
                                                             ),
                                                           );
                                                         },
                                                     );
                                                   },
                                               );
                                             },
                                             icon: Icon(Icons.more_horiz)
                                         ),
                                       ],
                                     ),
                                     Container(
                                       height: 300,
                                       width: 320,
                                       child: ListView.builder(
                                           itemCount: _modal_items.length,
                                           itemBuilder: (context, i){
                                              var key = _modal_items.keys.elementAt(i);
                                              return Card(
                                                child: ListTile(
                                                  title: Text('${_modal_items[key]!["training_name"]}, $index'),
                                                ),
                                              );
                                           },
                                       ),
                                     ),
                                   ],
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