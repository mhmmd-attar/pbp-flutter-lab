class WatchItem {
  WatchItem({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  final String watched;
  final String title;
  final int rating;
  final DateTime releaseDate;
  final String review;

  factory WatchItem.fromJson(Map<String, dynamic> json) => WatchItem(
    watched: json["fields"]["watched"]=="Y"?"watched":"not watched",
    title: json["fields"]["title"],
    rating: json["fields"]["rating"],
    releaseDate: DateTime.parse(json["fields"]["release_date"]),
    review: json["fields"]["review"]
  );

  Map<String, dynamic> toJson() => {
    "watched": watched=='watched'?'Y':'N',
    "title": title,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}
