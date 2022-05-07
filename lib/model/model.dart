//すべてのモデル情報を管理するベースとなるクラス
import 'package:training_note/util/keys.dart';

/// モデル定義

abstract class Model {
  static void setModel({required Keys key, required Model model}) {
    String _key = key.keyName;
    Model _model = key.clazz;
  }

  void setValue({required String key, required dynamic val}) {

  }
  
  dynamic getValue({required String key}) {
    Map map = getMap();
    return map[key];
  }

  Map<String, dynamic> getMap();
}