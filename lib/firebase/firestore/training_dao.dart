import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiver/strings.dart';
import 'package:training_note/model/training/training.dart';

import '../../model/model.dart';
import '../../util/keys.dart';

class TrainingDao {
  static const String tableName = "トレーニング管理";
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference trainingDao = _firestoreInstance.collection(tableName);
  
  static Future<dynamic> create({required Training training}) async {
    String _accountId = training.getValue(key: Keys.accountId);

    if(isBlank(_accountId)) {
      return false;
    }

    trainingDao.doc().set(_getData(training));
    return false;
  }

  static Map<String, dynamic> _getData(Training training) {
    String accountId = training.getValue(key: Keys.accountId);
    Timestamp trainingDate = training.getValue(key: Keys.trainingDate);

    return {

    };
  }


}