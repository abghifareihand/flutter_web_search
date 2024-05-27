import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/tracking_response_model.dart';

class SearchHistory {
  static const _key = 'search_history';

   Future<void> addSearchEntry(Data data) async {
    final prefs = await SharedPreferences.getInstance();
    final searchHistory = prefs.getStringList(_key) ?? [];
    final entry = jsonEncode(data.toMap());
    if (!searchHistory.contains(entry)) {
      searchHistory.add(entry);
      await prefs.setStringList(_key, searchHistory);
    }
  }

   Future<List<Data>> getSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final searchHistory = prefs.getStringList(_key) ?? [];
    return searchHistory.map((entry) {
      final decodedEntry = jsonDecode(entry);
      return Data.fromMap(decodedEntry);
    }).toList();
  }

   Future<void> clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}