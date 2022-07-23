import 'package:training_note/model/model.dart';

import '../util/keys.dart';

abstract class AbstractFirebase {

  static Map<String, dynamic> setDatabase({required Model model}) {
    Map<Keys, dynamic> _map = model.getMap();

    List<Keys> _keySet = _map.keys.toList();

    Map<String, dynamic> _resultMap = {};

    for(var i = 0; i < _keySet.length; i++) {
      Keys key = _keySet[i];
      String strKey = key.getKeyName();

      _resultMap[strKey] = _map[key];
    }

    return _resultMap;

  }
}