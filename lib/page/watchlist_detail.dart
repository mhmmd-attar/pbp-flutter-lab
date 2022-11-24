import 'package:flutter/material.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/model/watchlist.dart';

class WatchlistDetail extends StatefulWidget {
  const WatchlistDetail({super.key, required this.watchItem});

  final WatchItem watchItem;

  @override
  State<WatchlistDetail> createState() => _WatchlistDetailState();
}

class _WatchlistDetailState extends State<WatchlistDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(widget.watchItem.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ),
          Row(children: [
            Expanded(
              flex: 3,
              child: Column(children: const [
                Text("Release Data", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Rating", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Status", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Review", style: TextStyle(fontWeight: FontWeight.bold)),
              ]),
            ),
            Expanded(
              flex: 7,
              child: Column(children: [
                Text(": ${widget.watchItem.releaseDate.toString()}"),
                Text(": ${widget.watchItem.rating.toString()}/5"),
                Text(": ${widget.watchItem.watched}"),
                const Text(":"),
              ]),
            ),
          ]),
          Text(widget.watchItem.review),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ]),
      )
    );
  }
}