// To parse this JSON data, do
//
//     final movieinfo = movieinfoFromJson(jsonString);

import 'dart:convert';

Movieinfo movieinfoFromJson(String str) => Movieinfo.fromJson(json.decode(str));

String movieinfoToJson(Movieinfo data) => json.encode(data.toJson());

class Movieinfo {
  Movieinfo({
    this.id,
    this.imdbId,
    this.title,
    this.year,
    this.synopsis,
    this.runtime,
    this.released,
    this.certification,
    this.torrents,
    this.trailer,
    this.genres,
    this.images,
    this.rating,
  });

  String id;
  String imdbId;
  String title;
  String year;
  String synopsis;
  String runtime;
  int released;
  String certification;
  Torrents torrents;
  String trailer;
  List<String> genres;
  Images images;
  Rating rating;

  factory Movieinfo.fromJson(Map<String, dynamic> json) => Movieinfo(
        id: json["_id"] == null ? null : json["_id"],
        imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        synopsis: json["synopsis"] == null ? null : json["synopsis"],
        runtime: json["runtime"] == null ? null : json["runtime"],
        released: json["released"] == null ? null : json["released"],
        certification:
            json["certification"] == null ? null : json["certification"],
        torrents: json["torrents"] == null
            ? null
            : Torrents.fromJson(json["torrents"]),
        trailer: json["trailer"] == null ? null : json["trailer"],
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "imdb_id": imdbId == null ? null : imdbId,
        "title": title == null ? null : title,
        "year": year == null ? null : year,
        "synopsis": synopsis == null ? null : synopsis,
        "runtime": runtime == null ? null : runtime,
        "released": released == null ? null : released,
        "certification": certification == null ? null : certification,
        "torrents": torrents == null ? null : torrents.toJson(),
        "trailer": trailer == null ? null : trailer,
        "genres":
            genres == null ? null : List<dynamic>.from(genres.map((x) => x)),
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

class Torrents {
  Torrents({
    this.en,
  });

  En en;

  factory Torrents.fromJson(Map<String, dynamic> json) => Torrents(
        en: json["en"] == null ? null : En.fromJson(json["en"]),
      );

  Map<String, dynamic> toJson() => {
        "en": en == null ? null : en.toJson(),
      };
}

class En {
  En({
    this.the2160P,
    this.the1080P,
    this.the720P,
  });

  The0P the2160P;
  The0P the1080P;
  The0P the720P;

  factory En.fromJson(Map<String, dynamic> json) => En(
        the2160P: json["2160p"] == null ? null : The0P.fromJson(json["2160p"]),
        the1080P: json["1080p"] == null ? null : The0P.fromJson(json["1080p"]),
        the720P: json["720p"] == null ? null : The0P.fromJson(json["720p"]),
      );

  Map<String, dynamic> toJson() => {
        "2160p": the2160P == null ? null : the2160P.toJson(),
        "1080p": the1080P == null ? null : the1080P.toJson(),
        "720p": the720P == null ? null : the720P.toJson(),
      };
}

class The0P {
  The0P({
    this.url,
    this.seed,
    this.peer,
    this.size,
    this.filesize,
    this.provider,
  });

  String url;
  int seed;
  int peer;
  int size;
  String filesize;
  String provider;

  factory The0P.fromJson(Map<String, dynamic> json) => The0P(
        url: json["url"] == null ? null : json["url"],
        seed: json["seed"] == null ? null : json["seed"],
        peer: json["peer"] == null ? null : json["peer"],
        size: json["size"] == null ? null : json["size"],
        filesize: json["filesize"] == null ? null : json["filesize"],
        provider: json["provider"] == null ? null : json["provider"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "seed": seed == null ? null : seed,
        "peer": peer == null ? null : peer,
        "size": size == null ? null : size,
        "filesize": filesize == null ? null : filesize,
        "provider": provider == null ? null : provider,
      };
}
