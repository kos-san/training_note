import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_note/view/parts/add_training_details.dart';
import 'package:training_note/view/parts/home_page.dart';

String trainingName = "";

class SelectExercise extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {

  // 種目のダミーデータ
  Map<String, List<String>>_trainings = {'胸': ['ベンチプレス', 'インクラインダンベルプレス', 'ケーブルクロスオーバー'], '背中': ['ベントオーバーロー', 'ラットプルダウン', 'プルアップ'], '腕': ['トライセプスエクステンション', 'ダンベルバイセップスカール'], '脚': ['バーベルスクワット', 'レッグエクステンション'], '肩': ['ショルダープレス', 'サイドレイズ', 'リアデルト']};

  // 種目名のwidgetを返す
  List<Widget> _getTrainingNames(List<String> trainings){
    final List<Widget> _widgets = <Widget>[];
    trainings.forEach((training) {
      _widgets.add(
        Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0XFF79747E)),
                bottom: BorderSide(color: Color(0XFF79747E)),
              ),
            ),
            width: 360,
            padding: EdgeInsets.fromLTRB(8, 4, 0, 4),
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
              ),
              child: Text(
                  training,
                  style: TextStyle(
                    fontSize: 18
                  ),
              ),
              onPressed: () {
                trainingName = training;
                print(trainingName);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTrainingDetails(training: _exerciseName!)),
                );
              },
            )
        )
      );
    });
    return _widgets;
  }

  // 部位のwidgetを返す
  List<Widget> _getItems(){
    final List<Widget> _widgets = <Widget>[];
    _trainings.forEach((key, value) {
      _widgets.add(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0XFFF3EDF7),
                  border: Border(
                    top: BorderSide(color: Color(0XFF79747E)),
                    bottom: BorderSide(color: Color(0XFF79747E)),
                  ),
                ),
                width: 360,
                padding: EdgeInsets.fromLTRB(8, 4, 0, 4),
                child: Text(
                  key,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _getTrainingNames(value),
              ),
            ],
          )
      );
    });
    return _widgets;
  }

  void _addItem(String selectedItem, String exerciseName){
    setState(() {
      _trainings[selectedItem]!.add(exerciseName);
    });
    print(_trainings);
  }

  var _controller = TextEditingController();

  String? isSelectedItem = '胸';

  String? _exerciseName = '';

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
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
        title: Text('種目を選択', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(6),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0XFF6750A4),
                  shape: StadiumBorder(),
                  fixedSize: Size(90, 10),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  HomePage()),
                  );
                },
                child: Text('編集', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: IconButton(
              icon: Icon(Icons.add),
              color: Color(0XFF6750A4),
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (context){
                      return StatefulBuilder(
                          builder: (context, setState) {
                            return SimpleDialog(
                                insetPadding: EdgeInsets.all(8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                contentPadding: EdgeInsets.all(0.0),
                                titlePadding: EdgeInsets.all(0.0),
                                title: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    // color: Color(0XFFE7E0EC),
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
                                          Text('新規エクササイズを追加'),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              minimumSize: Size.zero,
                                              padding: EdgeInsets.zero,
                                            ),
                                            child: Text(
                                              '保存',
                                              style: TextStyle(
                                                  fontSize: 18
                                              ),
                                            ),
                                            onPressed: ()=>{
                                              print('エクササイズ名: ${_exerciseName}, 部位: ${isSelectedItem}'),
                                              print(_trainings),
                                              _addItem(isSelectedItem!, _exerciseName!),
                                              _controller.clear(),
                                              Navigator.pop(context)
                                            },
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          TextField(
                                            controller: _controller,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0XFFE7E0EC),
                                                ),
                                              ),
                                              hintText: 'エクササイズ名を入力',
                                              suffixIcon: IconButton(
                                                onPressed: () => _controller.clear(),
                                                icon: Icon(Icons.clear),
                                              ),
                                            ),
                                            onChanged: (String value){
                                              setState((){
                                                _exerciseName = value;
                                              });
                                            },
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('部位'),
                                              DropdownButton(
                                                  items: [
                                                    DropdownMenuItem(
                                                        child: Text('胸'),
                                                        value: '胸',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('背中'),
                                                      value: '背中',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('脚'),
                                                      value: '脚',
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text('肩'),
                                                      value: '肩',
                                                    ),
                                                  ],
                                                  onChanged: (String? value){
                                                    setState(() {
                                                      isSelectedItem = value;
                                                    });
                                                  },
                                                  value: isSelectedItem,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            );
                          },
                        );
                    },
                );
              },
              iconSize: 40,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: _getItems(),
      )
    );
  }
}
