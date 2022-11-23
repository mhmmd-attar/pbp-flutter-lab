import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';

Future<List<WatchList>> fetchWatchlist() async {
  var url = Uri.parse('https://asgmt2-django-mvt.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<WatchList> listWatchList = [];
  for (var d in data) {
    if (d != null) {
      listWatchList.add(WatchList.fromJson(d));
    }
  }

  return listWatchList;
}
