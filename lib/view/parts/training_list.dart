import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_note/view/parts/home_page.dart';
import 'package:intl/intl.dart';

List<dynamic> test = [[{"date": DateTime.now().subtract(Duration(days: 1))}, {"exercise": [{"プルアップ": [{"weight": [20, 10]}, {"reps": [12, 12]}]}]}], [{"date": DateTime.now().subtract(Duration(days: 2))}, {"exercise": [{"ベンチプレス": [{"weight": [20, 10, 30]}, {"reps": [12, 12, 12]}]}]}]];


class TrainingList extends StatefulWidget {
  @override
  _TrainingListState createState() => _TrainingListState();
}

class _TrainingListState extends State<TrainingList> {
  var items = List<String>.generate(20, (i) => "2021/04/$i");
  var _modal_items = {'one': {'training_name': 'ベンチプレス'}, 'two': {'training_name': 'インクラインダンベルプレス'}};


  void _removeItem(int index){
    setState((){
      test.removeAt(index);
    });
  }

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
        automaticallyImplyLeading: false,
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
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('カレンダー', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: test.length,
          itemBuilder: (context, index) {
             return InkWell(
               child: Card(
                 margin: const EdgeInsets.all(20.0),
                 child: Container(
                     padding: EdgeInsets.all(10.0),
                     width: 300,
                     height: 100,
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           '${DateFormat('yyyy/MM/dd').format(test[index][0]["date"])}',
                           style: TextStyle(fontSize: 24),
                         ),
                         IconButton(
                           icon: Icon(Icons.more_horiz),
                           padding: EdgeInsets.all(0.0),
                           constraints: BoxConstraints(),
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
                                             GestureDetector(
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
                                                           titlePadding: EdgeInsets.fromLTRB(20, 40, 20, 10),
                                                           title: Container(
                                                             height: 200,
                                                             child: Column(
                                                               crossAxisAlignment: CrossAxisAlignment.center,
                                                               mainAxisAlignment: MainAxisAlignment.center,
                                                               children: [
                                                                 Row(
                                                                   children: [
                                                                     Text('${DateFormat('yyyy/MM/dd').format(test[index][0]["date"])}'),
                                                                   ],
                                                                 ),
                                                                 Row(
                                                                   children: [
                                                                     Text('このワークアウトを本当に削除しますか？', style: TextStyle(fontSize: 16),),
                                                                   ],
                                                                 ),
                                                                 SizedBox(
                                                                   width: double.infinity,
                                                                   child: ElevatedButton(
                                                                     onPressed: () async {
                                                                       _removeItem(index);
                                                                       Navigator.push(
                                                                         context,
                                                                         MaterialPageRoute(builder: (context) => TrainingList()),
                                                                       );
                                                                     },
                                                                     child: Text('削除'),
                                                                     style: ElevatedButton.styleFrom(
                                                                       primary: Colors.red,
                                                                       onPrimary: Colors.white,
                                                                       shape: StadiumBorder(),
                                                                     ),
                                                                   ),
                                                                 ),
                                                                 SizedBox(height: 20),
                                                                 SizedBox(
                                                                   width: double.infinity,
                                                                   child: ElevatedButton(
                                                                     onPressed: ()=>{
                                                                       Navigator.of(context).pop()
                                                                     },
                                                                     child: Text('キャンセル'),
                                                                     style: ElevatedButton.styleFrom(
                                                                       primary: Color(0XFFD9D9D9),
                                                                       onPrimary: Colors.black,
                                                                       shape: StadiumBorder(),
                                                                     ),
                                                                   ),
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
                                               child: Row(
                                                 children: [
                                                   Icon(Icons.clear, color: Colors.red),
                                                   Text('削除')
                                                 ],
                                               ),
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
                         ),
                       ],
                     )
                 ),
               ),
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
                                         Text('${test[index][0]["date"]}'),
                                         IconButton(
                                             padding: EdgeInsets.all(0.0),
                                             constraints: BoxConstraints(),
                                             onPressed: ()=>{

                                             },
                                             icon: Icon(Icons.mode_edit, color: Color(0XFF6750A4)))
                                       ],
                                     ),
                                     SizedBox(
                                       height: 200,
                                       child: ListView.builder(
                                          // shrinkWrap: true,
                                          itemCount: test[index][1]["exercise"]!.length,
                                          itemBuilder: (context, index2) {
                                            var key = test[index][1]["exercise"][index2].keys.elementAt(index);
                                            return SizedBox(
                                              height: 200,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text('${key}'),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("セット"),
                                                      Text("Kg"),
                                                      Text("レップス"),
                                                    ],
                                                  ),
                                                  // Expanded(
                                                  //   child: ListView.builder(
                                                  //     shrinkWrap: true,
                                                  //     physics: NeverScrollableScrollPhysics(),
                                                  //     itemCount: test[index][1]["exercise"][index2][key][0]["weight"]!
                                                  //         .length,
                                                  //     itemBuilder: (context, index3) {
                                                  //       return SizedBox(
                                                  //         width: MediaQuery.of(context).size.width * 0.8,
                                                  //         child: Column(
                                                  //           children: [
                                                  //             SizedBox(
                                                  //               width: 300,
                                                  //               child: Row(
                                                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //                 children: [
                                                  //                   Text('${index2 + 1}'),
                                                  //                   Text('${test[index][1]["exercise"][index2][key][0]["weight"][index3]}'),
                                                  //                   Text('${test[index][1]["exercise"][index2][key][0]["reps"][index3]}'),
                                                  //                 ],
                                                  //               ),
                                                  //             ),
                                                  //           ],
                                                  //         ),
                                                  //       );
                                                  //     },
                                                  //   ),
                                                  // ),
                                                ],
                                              ),
                                            );
                                          }
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                           );
                      }
                    );
                  }
                );
              },
            );
          },
        ),
      ),
    );
  }
}