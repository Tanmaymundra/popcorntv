// To parse this JSON data, do
//
//     final tvshowinfo = tvshowinfoFromJson(jsonString);

import 'dart:convert';

Tvshowinfo tvshowinfoFromJson(String str) =>
    Tvshowinfo.fromJson(json.decode(str));

String tvshowinfoToJson(Tvshowinfo data) => json.encode(data.toJson());

class Tvshowinfo {
  Tvshowinfo({
    this.id,
    this.imdbId,
    this.tvdbId,
    this.title,
    this.year,
    this.slug,
    this.synopsis,
    this.runtime,
    this.country,
    this.network,
    this.airDay,
    this.airTime,
    this.status,
    this.numSeasons,
    this.lastUpdated,
    this.v,
    this.episodes,
    this.genres,
    this.images,
    this.rating,
  });

  String id;
  String imdbId;
  String tvdbId;
  String title;
  String year;
  String slug;
  String synopsis;
  String runtime;
  String country;
  String network;
  String airDay;
  String airTime;
  String status;
  int numSeasons;
  int lastUpdated;
  int v;
  List<Episode> episodes;
  List<String> genres;
  Images images;
  Rating rating;

  factory Tvshowinfo.fromJson(Map<String, dynamic> json) => Tvshowinfo(
        id: json["_id"] == null ? null : json["_id"],
        imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
        tvdbId: json["tvdb_id"] == null ? null : json["tvdb_id"],
        title: json["title"] == null ? null : json["title"],
        year: json["year"] == null ? null : json["year"],
        slug: json["slug"] == null ? null : json["slug"],
        synopsis: json["synopsis"] == null ? null : json["synopsis"],
        runtime: json["runtime"] == null ? null : json["runtime"],
        country: json["country"] == null ? null : json["country"],
        network: json["network"] == null ? null : json["network"],
        airDay: json["air_day"] == null ? null : json["air_day"],
        airTime: json["air_time"] == null ? null : json["air_time"],
        status: json["status"] == null ? null : json["status"],
        numSeasons: json["num_seasons"] == null ? null : json["num_seasons"],
        lastUpdated: json["last_updated"] == null ? null : json["last_updated"],
        v: json["__v"] == null ? null : json["__v"],
        episodes: json["episodes"] == null
            ? null
            : List<Episode>.from(
                json["episodes"].map((x) => Episode.fromJson(x))),
        genres: json["genres"] == null
            ? null
            : List<String>.from(json["genres"].map((x) => x)),
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
        "synopsis": synopsis == null ? null : synopsis,
        "runtime": runtime == null ? null : runtime,
        "country": country == null ? null : country,
        "network": network == null ? null : network,
        "air_day": airDay == null ? null : airDay,
        "air_time": airTime == null ? null : airTime,
        "status": status == null ? null : status,
        "num_seasons": numSeasons == null ? null : numSeasons,
        "last_updated": lastUpdated == null ? null : lastUpdated,
        "__v": v == null ? null : v,
        "episodes": episodes == null
            ? null
            : List<dynamic>.from(episodes.map((x) => x.toJson())),
        "genres":
            genres == null ? null : List<dynamic>.from(genres.map((x) => x)),
        "images": images == null ? null : images.toJson(),
        "rating": rating == null ? null : rating.toJson(),
      };
}

class Episode {
  Episode({
    this.torrents,
    this.watched,
    this.firstAired,
    this.dateBased,
    this.overview,
    this.title,
    this.episode,
    this.season,
    this.tvdbId,
  });

  Torrents torrents;
  Watched watched;
  int firstAired;
  bool dateBased;
  String overview;
  String title;
  int episode;
  int season;
  int tvdbId;

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        torrents: json["torrents"] == null
            ? null
            : Torrents.fromJson(json["torrents"]),
        watched:
            json["watched"] == null ? null : Watched.fromJson(json["watched"]),
        firstAired: json["first_aired"] == null ? null : json["first_aired"],
        dateBased: json["date_based"] == null ? null : json["date_based"],
        overview: json["overview"] == null ? null : json["overview"],
        title: json["title"] == null ? null : json["title"],
        episode: json["episode"] == null ? null : json["episode"],
        season: json["season"] == null ? null : json["season"],
        tvdbId: json["tvdb_id"] == null ? null : json["tvdb_id"],
      );

  Map<String, dynamic> toJson() => {
        "torrents": torrents == null ? null : torrents.toJson(),
        "watched": watched == null ? null : watched.toJson(),
        "first_aired": firstAired == null ? null : firstAired,
        "date_based": dateBased == null ? null : dateBased,
        "overview": overview == null ? null : overview,
        "title": title == null ? null : title,
        "episode": episode == null ? null : episode,
        "season": season == null ? null : season,
        "tvdb_id": tvdbId == null ? null : tvdbId,
      };
}

class Torrents {
  Torrents({
    this.the0,
    this.the1080P,
    this.the480P,
    this.the720P,
    this.the2160P,
  });

  The0 the0;
  The0 the1080P;
  The0 the480P;
  The0 the720P;
  The0 the2160P;

  factory Torrents.fromJson(Map<String, dynamic> json) => Torrents(
        the0: json["0"] == null ? null : The0.fromJson(json["0"]),
        the1080P: json["1080p"] == null ? null : The0.fromJson(json["1080p"]),
        the480P: json["480p"] == null ? null : The0.fromJson(json["480p"]),
        the720P: json["720p"] == null ? null : The0.fromJson(json["720p"]),
        the2160P: json["2160p"] == null ? null : The0.fromJson(json["2160p"]),
      );

  Map<String, dynamic> toJson() => {
        "0": the0 == null ? null : the0.toJson(),
        "1080p": the1080P == null ? null : the1080P.toJson(),
        "480p": the480P == null ? null : the480P.toJson(),
        "720p": the720P == null ? null : the720P.toJson(),
        "2160p": the2160P == null ? null : the2160P.toJson(),
      };
}

class The0 {
  The0({
    this.provider,
    this.peers,
    this.seeds,
    this.url,
  });

  String provider;
  int peers;
  int seeds;
  String url;

  factory The0.fromJson(Map<String, dynamic> json) => The0(
        provider: json["provider"] == null ? null : json["provider"],
        peers: json["peers"] == null ? null : json["peers"],
        seeds: json["seeds"] == null ? null : json["seeds"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "provider": provider == null ? null : provider,
        "peers": peers == null ? null : peers,
        "seeds": seeds == null ? null : seeds,
        "url": url == null ? null : url,
      };
}

class Watched {
  Watched({
    this.watched,
  });

  bool watched;

  factory Watched.fromJson(Map<String, dynamic> json) => Watched(
        watched: json["watched"] == null ? null : json["watched"],
      );

  Map<String, dynamic> toJson() => {
        "watched": watched == null ? null : watched,
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
