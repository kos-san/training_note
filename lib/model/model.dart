//すべてのモデル情報を管理するベースとなるクラス
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiver/strings.dart';
import 'package:training_note/model/model_array.dart';
import 'package:training_note/model/model_pool.dart';
import 'package:training_note/util/keys.dart';

abstract class Model extends ModelPool{

  /// 削除モデル判定用
  bool deleteFlg = false;
  /// 更新モデル判定用
  bool updateFlg = false;
  /// 新規モデル判定用
  bool createFlg = false;

  /// アカウントモデルを取得する
  Model? getAccountModel() {
    return getAccountModel();
  }

  ///　ユーザーモデルを取得する
  Model? getUserModel() {
    return getUserModel();
  }

  void setModel({required Keys key, required Model model}) {
    ModelPool.modelPool[key] = model;
  }

  Model? getModel({required Keys key}) {
    Model? targetModel = ModelPool.modelPool[key];

    return targetModel;
  }

  ModelArray? getModelArray({required Keys key}) {
    ModelArray? targetModelArray = ModelPool.modelPool[key] as ModelArray;

    return targetModelArray;
  }

  void setValue({required Keys key, required dynamic val});

  dynamic getValue({required Keys key}) => getMap()[key];

  Map<Keys, dynamic> getMap();

  /// モデルが更新されたモデルか判定する
  bool isUpdate() {
    if(updateFlg) {
      Map modelMap = getMap();
      modelMap[Keys.updatedTime] = Timestamp.now();
    }
    return updateFlg;
  }

  bool isCreate() {
    return createFlg;
  }


  /// 対象のモデル項目値が空文字またはNULLか判定する<br>
  /// NULLまたは空文字の場合 -FALSE<br>
  /// 値が存在する場合 -TRUE
  bool isBlankCheck(Keys key) {
    bool result = false;
    String _val = getValue(key: key);
    print("【LOG】 --blankチェック【開始】--");
    print("【LOG】 --対象項目値：[${key.getKeyName()}]");
    if(isBlank(_val)) {
      print("【LOG】 --判定結果:[NG]--");
    } else {
      result = true;
      print("【LOG】 --判定結果:[OK]--");
    }
    print("【LOG】 --blankチェック【終了】--");
    return result;
  }
}