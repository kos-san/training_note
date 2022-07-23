import 'package:training_note/model/account.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/model/user.dart';

import '../util/keys.dart';

class ModelPool {
  static Map<Keys, Model> modelPool = {};

  static Model? getModel(Keys key) {
    return modelPool[key];
  }

  /// アカウントモデルを取得する
  static Model? getAccountModel() {
    return modelPool[Keys.account];
  }

  ///　ユーザーモデルを取得する
  static Model? getUserModel() {
    return modelPool[Keys.user];
  }
}