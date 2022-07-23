import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:training_note/firebase/firestore/users.dart';
import 'package:training_note/model/model.dart';
import 'package:training_note/util/keys.dart';

import '../util/log.dart';

class User extends Model {
  String? _id;
  String? _accountId;
  String? _name;
  String? _gender;
  Timestamp? _birthDay;
  Timestamp? _createdTime;
  Timestamp? _updatedTime;

  User({String? id, String? accountId, String? name, String? gender, Timestamp? birthday}) {
    _id = id;
    _accountId = accountId;
    _name = name;
    _gender = gender;
    _birthDay = birthday;
  }

  Future<dynamic> create() async {
    var result = await Users.create(user: this);

    return result;
  }

  Future<dynamic> commit() async{
    if(createFlg) {
      await Users.create(user: this);
    }

    return true;
  }

  Future<dynamic> read() async {

    return true;
  }

  @override
  Map<Keys, dynamic> getMap() {
    return {
      Keys.id: _id,
      Keys.accountId: _accountId,
      Keys.name: _name,
      Keys.gender: _gender,
      Keys.birthDay: _birthDay,
      Keys.createdTime: _createdTime,
      Keys.updatedTime: _updatedTime
    };
  }

  @override
  void setValue({required Keys key, required val}) {
    switch(key.getKeyName()) {
      case "id":
        _id = val;
        break;
      case "accountId":
        _accountId = val;
        break;
      case "name":
        _name = val;
        break;
      case "gender":
        _gender = val;
        break;
      case "birthDay":
        _birthDay = val;
        break;
      default:
        Log.NG(actionName: "モデル項目のセット", detail: "対象キーなし");
        break;
    }
  }

}