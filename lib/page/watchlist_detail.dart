import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/model/watchlist.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class WatchlistDetail extends StatefulWidget {
  const WatchlistDetail({super.key, required this.watchItem});

  final WatchItem watchItem;

  @override
  State<WatchlistDetail> createState() => _WatchlistDetailState();
}

class _WatchlistDetailState extends State<WatchlistDetail> {
  DateFormat dateOnly = DateFormat("d, MMM yyyy");

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
            child: Text(widget.watchItem.fields.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              flex: 30,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text("Released On", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Rating", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Status", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("Review", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ]),
            ),
            Expanded(
              flex: 70,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(": ${dateOnly.format(widget.watchItem.fields.releaseDate)}", style: const TextStyle(fontSize: 16)),
                Text(widget.watchItem.fields.rating == null ? ': 0/10' : ': ${widget.watchItem.fields.rating}/10', style: const TextStyle(fontSize: 16)),
                Text(widget.watchItem.fields.watched == Watched.Y ? ": Watched" : ": Not Watched", style: const TextStyle(fontSize: 16)),
                const Text(":", style: const TextStyle(fontSize: 16)),
              ]),
            ),
          ]),
          Align(
            alignment: Alignment.topLeft,
            child: Text(widget.watchItem.fields.review == "-" ? 'No review' : widget.watchItem.fields.review, style: const TextStyle(fontSize: 16)),
          ),
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
                  "Back",
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