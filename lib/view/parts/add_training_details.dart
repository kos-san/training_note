import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_note/main.dart';
import 'package:training_note/view/parts/home_page.dart';
import 'package:training_note/view/parts/select_exercise.dart';
import 'package:training_note/view/parts/training_list.dart';


List<dynamic> testData = [{"date": DateTime.now()}, {"exercise": []}];

dynamic controllers = [];

dynamic controllersForReps = [];

void addExercise(String itemName){
  var item = {itemName: [{"weight": [0]}, {"reps": [0]}]};
  testData[1]["exercise"]!.add(item);
}

class AddTrainingDetails extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _AddTrainingDetails();

}

class _AddTrainingDetails extends State<AddTrainingDetails> {

  DateTime date = DateTime.now();

  void _showDialog(Widget child){
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
        )
    );
  }

  //this is a test method1
  void _addItem(String trainingName,  int index){
    var _value = 0;
    setState(() {
      // _trainingSet[trainingName]!.add(_set);
      testData[1]["exercise"][index][trainingName][0]["weight"].add(_value);
      testData[1]["exercise"][index][trainingName][1]["reps"].add(_value);
    });
  }

  void _removeItem(String trainingName, int index, int index2){
    setState(() {
      // _trainingSet[trainingName]!.removeAt(index);
      testData[1]["exercise"][index][trainingName][0]["weight"].removeAt(index2);
      testData[1]["exercise"][index][trainingName][1]["reps"].removeAt(index2);
    });
  }

  void _addTextEditingController(int index){
    setState(() {
      controllers![index].add(TextEditingController());
      controllersForReps![index].add(TextEditingController());
    });
  }

  void _removeTextEditingController(int index, index2){
    setState(() {
      controllers![index].removeAt(index2);
      controllersForReps![index].removeAt(index2);
    });
  }

  void _addNewExerciseToList(){
    setState(() {
      test.insert(0, testData);
    });
  }

  void _cleanTestDate(){
    setState(() {
      testData = [{"date": DateTime.now()}, {"exercise": []}];
    });
  }

  void _addNewItem(String selectedItem, String exerciseName){
    setState(() {
      trainings[selectedItem]!.add(exerciseName);
    });
  }

  var _controller = TextEditingController();

  String? isSelectedItem = '胸';

  String? _exerciseName = '';

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  Widget _buildModal(){
    Widget modal;

    modal = GestureDetector(
      onTap: () async {
        await showModalBottomSheet(
          context: context,
          builder: (context){
            return
              DraggableScrollableSheet(
                  initialChildSize: 1,
                  builder: (BuildContext context, ScrollController scrollController){
                    return
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('種目を選択', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
                                IconButton(
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
                                                              _addNewItem(isSelectedItem!, _exerciseName!),
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
                              ],
                            ),
                            SelectExercise(),
                          ],
                        ),
                      );
                  }
              );
          },
        );
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add, color: Color(0XFF6750A4)),
            Text(
                'エクササイズを追加',
                style: TextStyle(color: Color(0XFF6750A4))
            )
          ]
      ),
    );

    return modal;


  }

  void _removeExercise(String key, int index){
      setState(() {
        testData[1]["exercise"].removeAt(index);
        controllers!.removeAt(index);
        controllersForReps!.removeAt(index);
      });
  }

  Widget _cancellWorkout(){
    Widget row;

    row = GestureDetector(
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
                            Text('このワークアウトを本当にキャンセルしますか？', style: TextStyle(fontSize: 16),),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              setState((){
                                testData = [{"date": DateTime.now()}, {"exercise": []}];
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyHomePage(title: 'test')),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ワークアウトをキャンセルする',
              style: TextStyle(color: Colors.red)
            )
          ]
      ),
    );

    return row;
  }

  Widget _buildBody(){
    Widget body;

    if (testData[1]["exercise"].length == 0){
      body = Container(
        child: Column(
          children: [
            Text("エクササイズを追加してください"),
            _buildModal(),
            _cancellWorkout()
          ],
        ),
      );
    } else {
      body = Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: testData[1]["exercise"]!.length,
                itemBuilder: (context, index){
                  var key = testData[1]["exercise"][index].keys.elementAt(0);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${key}'),
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
                                          height: 60,
                                          width: 110,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: ()=>{
                                                  _removeExercise(key, index),
                                                  Navigator.of(context).pop()
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.clear, color: Colors.red),
                                                    Text('このエクササイズを削除')
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
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("セット"),
                          Text("Kg"),
                          Text("レップス"),
                          Text(""),
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: testData[1]["exercise"][index][key][0]["weight"]!.length,
                        itemBuilder: (context, index2){
                          // _addTextEditingController(index);
                          return SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 300,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${index2 + 1} '),
                                      Container(
                                        width: 55,
                                        height: 40,
                                        child: TextField(
                                          controller: controllers![index][index2],
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          onChanged: (String value){
                                            testData[1]["exercise"][index][key][0]["weight"][index2] = int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0XFFE7E0EC),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 55,
                                        height: 40,
                                        child: TextField(
                                          controller: controllersForReps![index][index2],
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                          onChanged: (String value){
                                            testData[1]["exercise"][0][key][1]["reps"][index2] = int.parse(value);
                                          },
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0XFFE7E0EC),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: ()=>{
                                            _removeItem(key, index, index2),
                                            _removeTextEditingController(index, index2)
                                          },
                                          icon: Icon(Icons.clear, color: Colors.red,)
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: (){
                          _addItem(key, index);
                          _addTextEditingController(index);
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add, color: Color(0XFF6750A4)),
                              Text(
                                  'セットを追加',
                                  style: TextStyle(color: Color(0XFF6750A4))
                              )
                            ]
                        ),
                      ),
                    ],
                  );
                },
              ),
              _buildModal(),
              _cancellWorkout()
            ],
          ),
        ),
      );
    }

    return body;
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
        title: CupertinoButton(
          onPressed: () => _showDialog(
            CupertinoDatePicker(
                initialDateTime: date,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                onDateTimeChanged: (DateTime newDate){
                  setState(() {
                    testData[0]["date"] = newDate;
                  });
                }
            ),
          ),
          child: Text(
            '${testData[0]["date"].year}/${testData[0]["date"].month}/${testData[0]["date"].day}',
            style: const TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
        // title: Text('2022/06/01', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                onPressed: (){
                  print(testData);
                  print(date);
                  _addNewExerciseToList();
                  _cleanTestDate();
                  testFunction();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TrainingList()),
                  );
                },
                child: Text('完了', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
            ),
          ),
        ],
      ),
      body: _buildBody()
    );
  }

}