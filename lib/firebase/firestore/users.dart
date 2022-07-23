import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiver/strings.dart';
import 'package:training_note/firebase/abstract_firebase.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/model/model_array.dart';
import 'package:training_note/model/training/training.dart';
import 'package:training_note/model/user.dart';
import 'package:training_note/util/keys.dart';
import 'package:training_note/util/log.dart';

class Users extends AbstractFirebase{
  static const String tableName = "users";
  static final _firestoreInstance = FirebaseFirestore.instance;
  static final CollectionReference users = _firestoreInstance.collection(tableName);

  static dynamic create({required Model user}) {
    String? _uid = user.getValue(key: Keys.uid);

    if(isBlank(_uid)) {
      return false;
    }
    users.doc(_uid).set(AbstractFirebase.setDatabase(model: user));


    return true;
  }

  static Future<dynamic> read(User user) async{

    String _uid = user.getValue(key: Keys.accountId);
    try {
      var _result = await users.doc(_uid).get();
      String _name = _result[Keys.name.getKeyName()];
      String _gender = _result[Keys.gender.getKeyName()];
      String _birthDay = _result[Keys.birthDay.getKeyName()];
      Timestamp _createdTime = _result[Keys.createdTime.getKeyName()];
      Timestamp _updatedTime = _result[Keys.createdTime.getKeyName()];

      user.setValue(key: Keys.name, val: _name);
      user.setValue(key: Keys.gender, val: _gender);
      user.setValue(key: Keys.birthDay, val: _birthDay);
      user.setValue(key: Keys.createdTime, val: _createdTime);
      user.setValue(key: Keys.updatedTime, val: _updatedTime);
    } on Exception catch(e) {
      Log.error(exception: e);
      return false;
    }

    return true;
  }

}