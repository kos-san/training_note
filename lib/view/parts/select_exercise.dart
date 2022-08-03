import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:training_note/view/parts/add_training_details.dart';

dynamic trainingNameTest = [];

Map<String, List<String>> trainings = {'胸': ['ベンチプレス', 'インクラインダンベルプレス', 'ケーブルクロスオーバー'], '背中': ['ベントオーバーロー', 'ラットプルダウン', 'プルアップ'], '腕': ['トライセプスエクステンション', 'ダンベルバイセップスカール'], '脚': ['バーベルスクワット', 'レッグエクステンション'], '肩': ['ショルダープレス', 'サイドレイズ', 'リアデルト']};


class SelectExercise extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {

  void _addExercise(String itemName){
    dynamic item = {itemName: [{"weight": [0]}, {"reps": [0]}]};
    setState((){
      testData[1]["exercise"]!.add(item);
    });
    setState(() {
      controllers!.add([]);
      controllersForReps!.add([]);
    });
    setState(() {
      setState(() {
        controllers!.last.add(TextEditingController());
        controllersForReps!.last.add(TextEditingController());
      });
    });
  }

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
                  setState(() {
                    _addExercise(training);
                  });
                  print(testData);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddTrainingDetails()),
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
    trainings.forEach((key, value) {
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(20.0),
      children: _getItems(),
    );
  }
}
