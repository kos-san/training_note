/// jsonで作成したコンテンツを読み込み、処理を行うクラス
class JsonManager {
  String? _fileName;

  JsonManager(String? fileName) {
    if(fileName == null) {
      //TODO エラーログを出力する
    }
    _fileName = fileName;
  }

}