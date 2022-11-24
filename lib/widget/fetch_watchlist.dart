import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/watchlist.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<List<WatchItem>> fetchWatchlist() async {
  var url = Uri.parse('https://asgmt2-django-mvt.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));
  print("Decoded");
  print(data);
  List<WatchItem> listWatchList = [];
  print("Putting into list");
  for (var d in data) {
    print(d);
    if (d != null) {
      listWatchList.add(WatchItem.fromJson(d));
    }
  }

  return listWatchList;
}