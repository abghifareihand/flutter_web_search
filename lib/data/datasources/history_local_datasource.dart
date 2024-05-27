import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wifipos_web/data/models/tracking_response_model.dart';

class HistoryLocalDatasource {
  static const _historyKey = 'history';

  Future<bool> saveHistorySearch(List<Data> history) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> historyStrings =
        history.map((data) => jsonEncode(data.toMap())).toList();
    return await pref.setStringList(_historyKey, historyStrings);
  }

  Future<List<Data>> getHistorySearch() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> historyStrings = pref.getStringList(_historyKey) ?? [];
    return historyStrings
        .map((dataJson) => Data.fromMap(jsonDecode(dataJson)))
        .toList();
  }

  Future<bool> removeHistorySearch() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.remove(_historyKey);
  }
}
