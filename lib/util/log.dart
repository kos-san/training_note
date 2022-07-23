// ignore_for_file: unnecessary_null_comparison, non_constant_identifier_names

import 'package:logger/logger.dart';
import 'package:quiver/strings.dart';

class Log extends Logger{
  static const String _bar = "------------------------";

  /// デフォルト
  static final Logger _logger = Logger(
      printer: PrettyPrinter (
          methodCount: 3,
          printTime: true
      )
  );

  /// エラー用
  static final Logger _errorLog = Logger(
    printer: PrettyPrinter (
      methodCount: 15,
      printTime: true
    )
  );

  /// Logger：メソッド開始用
  static void start({String? actionName}) {
    var _message = "【開始】";
    if(isNotBlank(actionName)) {
      _message = _message + " --[処理名] " + actionName! + "--";
    }

    _logger.v(_message);
  }

  /// Logger: メソッド終了用
  static void end({String? actionName}) {
    var _message = "【終了】";
    if(isNotBlank(actionName)) {
      _message = _message + " --[処理名] " + actionName! + "--";
    }

    _logger.v(_message);
  }

  /// Logger: NGパターン
  static void NG({String? actionName, String? detail}) {
    var _message = "【判定結果：NG】";
    if(isNotBlank(actionName)) {
      _message = _message + "\n --[処理名] " + actionName! + "--";
    }
    if(isNotBlank(detail)) {
      _message = _message + "\n --[結果詳細] " + detail! + "--";
    }

    _logger.i(_message);
  }

  ///　ErrorLog: エラー発生時用<br>
  /// 想定しないエラーが発生した際にログ出力用に使用する
  static void error({Exception? exception}) {
    String msg = "予期せぬエラー";

    if(null != exception) {
      msg = msg + "\n" + "Exception: " + exception.toString();
    }

    _errorLog.e(msg);

  }

}