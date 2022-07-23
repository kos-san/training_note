import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Parts {

  static Timestamp convertTimestamp(String date) {
    Timestamp ts = Timestamp(1,2);

    return ts;
  }

  static String convertTimestampForString(Timestamp date) {
    String strDate = DateFormat("yyyy/MM/dd").format(date.toDate());

    return strDate;
  }

  /// システム日付を取得する<br>
  /// @return String システム日付("yyyy/MM/dd")
  static String systemDate() {
    var now = DateTime.now();
    String sysDate = DateFormat('yyyy/MM/dd').format(now);
    return sysDate;
  }

}