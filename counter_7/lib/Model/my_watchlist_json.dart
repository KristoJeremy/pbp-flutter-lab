// To parse this JSON data, do
//
//     final mywatchlist = mywatchlistFromJson(jsonString);

import 'dart:convert';

List<Mywatchlist> mywatchlistFromJson(String str) => List<Mywatchlist>.from(json.decode(str).map((x) => Mywatchlist.fromJson(x)));

String mywatchlistToJson(List<Mywatchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mywatchlist {
    Mywatchlist({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model model;
    int pk;
    Fields fields;

    factory Mywatchlist.fromJson(Map<String, dynamic> json) => Mywatchlist(
        model: modelValues.map[json["model"]]!,
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.movieWatched,
        required this.movieTitle,
        required this.movieRating,
        required this.movieReleaseDate,
        required this.movieReview,
    });

    String movieWatched;
    String movieTitle;
    int movieRating;
    String movieReleaseDate;
    String movieReview;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        movieWatched: json["movie_watched"],
        movieTitle: json["movie_title"],
        movieRating: json["movie_rating"],
        movieReleaseDate: json["movie_release_date"],
        movieReview: json["movie_review"],
    );

    Map<String, dynamic> toJson() => {
        "movie_watched": movieWatched,
        "movie_title": movieTitle,
        "movie_rating": movieRating,
        "movie_release_date": movieReleaseDate,
        "movie_review": movieReview,
    };
}

enum MovieWatched { YES, NOT_YET }

final movieWatchedValues = EnumValues({
    "Not yet": MovieWatched.NOT_YET,
    "Yes": MovieWatched.YES
});

enum Model { MYWATCHLIST_WATCHLISTITEMS }

final modelValues = EnumValues({
    "mywatchlist.watchlistitems": Model.MYWATCHLIST_WATCHLISTITEMS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
