// ignore_for_file: avoid_init_to_null

import 'package:training_note/model/model.dart';
import 'package:training_note/model/model_pool.dart';

import '../util/keys.dart';


abstract class ModelArray {
  List<Model> listModel = [];

  ModelArray() {
    List<Model> _listModel = <Model>[];
    listModel = _listModel;
  }

  void add(Model model) {
    listModel.add(model);
  }

  Model get(int i) {
    return listModel[i];
  }

  void remove(int i) {
    listModel.removeAt(i);
  }
}
