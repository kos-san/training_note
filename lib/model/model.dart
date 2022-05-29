//すべてのモデル情報を管理するベースとなるクラス
import 'package:training_note/model/model_keys.dart';
import 'package:training_note/model/user_info.dart';
import 'package:training_note/util/keys.dart';

///モデル定義
Map<ModelKeys, Model> mapModel = {};
abstract class Model {

  void setModel({required ModelKeys modelKey, required Model model}) {
    mapModel[modelKey] = model;
  }

  Model? getModel({required ModelKeys modelKey}) {
    Model? targetModel = mapModel[modelKey];
    if(targetModel == null) {
    }

    return targetModel;
  }

  void setValue({required String key, required dynamic val}){
    Map map = getMap();
    map[key] = val;
  }

  dynamic getValue({required String key}) {
    Map map = getMap();
    return map[key];
  }

  Map<String, dynamic> getMap();
}
