import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_note/view/parts/home_page.dart';
import 'package:training_note/view/parts/select_exercise.dart';

class AddTrainingDetails extends StatefulWidget {

  const AddTrainingDetails({Key? key, required this.training}) : super(key: key);

  final String training;

  @override
  State<StatefulWidget> createState() => _AddTrainingDetails();

}

class _AddTrainingDetails extends State<AddTrainingDetails> {

  List<String> _trainings = [trainingName];

  List<List<TextEditingController>>? _controllers = [[]];

  List<List<TextEditingController>>? _controllersForReps = [[]];

  String? _weight = "";

  String? _reps = "";

  //this is a test variable
  Map<String, List<Map<String, int>>> _trainingSet =  {trainingName: [{"重量": 0, "レップス": 0}]};


  @override
  void initState(){
    setState(() {
      for(int i = 0; i < _trainingSet.length; i++){
        _controllers!.insert(i, []);
        _controllersForReps!.insert(i, []);
      }
    });
    setState(() {
      setState(() {
        for(var key in _trainingSet.keys){
          for(int i = 0; i < _trainingSet[key]!.length; i++){
            _controllers![i].add(TextEditingController());
            _controllersForReps![i].add(TextEditingController());
          }
        }
      });
    });
    super.initState();
  }

  //this is a test method1
  void _addItem(String trainingName){
    Map<String, int> _set = {"重量": 0, "レップス": 0};
    setState(() {
      _trainingSet[trainingName]!.add(_set);
    });
  }

  void _removeItem(String trainingName, int index){
    setState(() {
      _trainingSet[trainingName]!.removeAt(index);
    });
  }

  void _addTextEditingController(int index){
    setState(() {
      _controllers![index].add(TextEditingController());
      _controllersForReps![index].add(TextEditingController());
    });
  }

  void _removeTextEditingController(int index, index2){
    setState(() {
      _controllers![index].removeAt(index2);
      _controllersForReps![index].removeAt(index2);
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
        title: Text('2022/06/01', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child: Text('完了', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)
            ),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        width: 300,
        child: Center(
          child: ListView.builder(
              itemCount: _trainings.length,
              itemBuilder: (context, index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${_trainings[index]}'),
                        IconButton(
                          icon: Icon(Icons.more_horiz),
                          padding: EdgeInsets.all(0.0),
                          constraints: BoxConstraints(),
                          onPressed: ()=> {},
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
                      itemCount: _trainingSet[_trainings[index]]?.length,
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
                                        controller: _controllers![index][index2],
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        onChanged: (String value){
                                          setState((){
                                            _weight =  value;
                                            print(_weight);
                                          });
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
                                        controller: _controllersForReps![index][index2],
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                        onChanged: (String value){
                                          setState((){
                                            _reps =  value;
                                            print(_reps);
                                          });
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
                                          _removeItem(_trainings[index], index),
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
                        print(trainingName);
                        _addItem(_trainings[index]);
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
        ),
      ),
    );
  }

}