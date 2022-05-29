import 'package:training_note/firebase/firestore/users.dart';
import 'package:training_note/model/user_info.dart';

class ModelKeys {
  static final ModelKeys userInfo = ModelKeys(UserInfo.modelName, Users.tableName);
  static final ModelKeys accountInfo = ModelKeys("accountInfo","");
  static final ModelKeys trainingInfo = ModelKeys("trainingInfo","");
  static final ModelKeys trainingDetailsInfo = ModelKeys("trariningDetailsInfo","");

  String? _modelName;
  String? _tableName;
  ModelKeys(String modelName, String tableName) {
    _modelName = modelName;
    _tableName = tableName;
  }

  String? getModelName() {
    return _modelName;
  }

  String? getTableName() {
    return _tableName;
  }
}