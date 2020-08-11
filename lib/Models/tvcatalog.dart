// To parse this JSON data, do
//
//     final tvcatalog = tvcatalogFromJson(jsonString);

import 'dart:convert';

List<Tvcatalog> tvcatalogFromJson(String str) =>
    List<Tvcatalog>.from(json.decode(str).map((x) => Tvcatalog.fromJson(x)));

String tvcatalogToJson(List<Tvcatalog> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tvcatalog {
  Tvcatalog({
    this.id,
    this.imdbId,
    this.tvdbId,
    this.title,
    this.year,
    this.slug,
    this.numSeasons,
    this.images,
    this.rating,
  });

  String id;
  String imdbId;
  String tvdbId;
  String title;
  String year;
  String slug;
  int numSeasons;
  Images images;
  Rating rating;

  factory Tvcatalog.fromJson(Map<String, dynamic> json) => Tvcatalog(
        id: json["_id"] == null ? null : json["_id"],
        imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
        tvdbId: json["tvdb_id"] == null ? null : json["tvdb_id"],
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        slug: json["slug"] == null ? null : json["slug"],
        numSeasons: json["num_seasons"] == null ? null : json["num_seasons"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "imdb_id": imdbId == null ? null : imdbId,
        "tvdb_id": tvdbId == null ? null : tvdbId,
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "slug": slug == null ? null : slug,
        "num_seasons": numSeasons == null ? null : numSeasons,
        "images": images == null ? null : images.toJson(),
        "rating": rating == null ? null : rating.toJson(),
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
        poster: json["poster"] == null ? null : json["poster"],
        fanart: json["fanart"] == null ? null : json["fanart"],
        banner: json["banner"] == null ? null : json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "poster": poster == null ? null : poster,
        "fanart": fanart == null ? null : fanart,
        "banner": banner == null ? null : banner,
      };
}

class Rating {
  Rating({
    this.percentage,
    this.watching,
    this.votes,
    this.loved,
    this.hated,
  });

  int percentage;
  int watching;
  int votes;
  int loved;
  int hated;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        percentage: json["percentage"] == null ? null : json["percentage"],
        watching: json["watching"] == null ? null : json["watching"],
        votes: json["votes"] == null ? null : json["votes"],
        loved: json["loved"] == null ? null : json["loved"],
        hated: json["hated"] == null ? null : json["hated"],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage == null ? null : percentage,
        "watching": watching == null ? null : watching,
        "votes": votes == null ? null : votes,
        "loved": loved == null ? null : loved,
        "hated": hated == null ? null : hated,
      };
}
