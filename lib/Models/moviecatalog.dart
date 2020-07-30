import 'dart:convert';

List<Moviecatalog> moviecatalogFromJson(String str) => List<Moviecatalog>.from(
    json.decode(str).map((x) => Moviecatalog.fromJson(x)));

String moviecatalogToJson(List<Moviecatalog> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Moviecatalog {
  Moviecatalog({
    this.id,
    this.imdbId,
    this.title,
    this.year,
    this.genres,
    this.images,
    this.rating,
  });

  String id;
  String imdbId;
  String title;
  String year;
  List<String> genres;
  Images images;
  Rating rating;

  factory Moviecatalog.fromJson(Map<String, dynamic> json) => Moviecatalog(
        id: json["_id"],
        imdbId: json["imdb_id"],
        title: json["title"],
        year: json["year"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        images: Images.fromJson(json["images"]),
        rating: Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "imdb_id": imdbId,
        "title": title,
        "year": year,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "images": images.toJson(),
        "rating": rating.toJson(),
      };
}

class Images {
  Images({
    this.poster,
    this.fanart,
    this.banner,
  });

  String poster;
  String fanart;
  String banner;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        poster: json["poster"],
        fanart: json["fanart"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "poster": poster,
        "fanart": fanart,
        "banner": banner,
      };
}

class Rating {
  Rating({
    this.percentage,
  });

  int percentage;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
      };
}
