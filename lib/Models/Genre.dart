import 'package:flutter/cupertino.dart';

class Genre {
  String mKey;
  String mLabel;

  Genre({this.mKey, this.mLabel});

  String getKey() {
    return mKey;
  }

  String getLabelId() {
    return mLabel;
  }

  List<Genre> getGenres() {
    return returngenres;
  }

  int getLength() {
    return returngenres.length;
  }
}

List<Genre> returngenres = [
  Genre(mKey: "all", mLabel: "All"),
  Genre(mKey: "action", mLabel: "Action"),
  Genre(mKey: "adventure", mLabel: "Adventure"),
  Genre(mKey: "animation", mLabel: "Animation"),
  Genre(mKey: "comedy", mLabel: "Comedy"),
  Genre(mKey: "crime", mLabel: "Crime"),
  Genre(mKey: "disaster", mLabel: "Disaster"),
  Genre(mKey: "documentary", mLabel: "Documentary"),
  Genre(mKey: "drama", mLabel: "Drama"),
  Genre(mKey: "eastern", mLabel: "Eastern"),
  Genre(mKey: "family", mLabel: "Family"),
  Genre(mKey: "fantasy", mLabel: "Fantasy"),
  Genre(mKey: "fan-film", mLabel: "Fan- film"),
  Genre(mKey: "film-noir", mLabel: " Film Noir"),
  Genre(mKey: "history", mLabel: "History"),
  Genre(mKey: "holiday", mLabel: "Holiday"),
  Genre(mKey: "horror", mLabel: "Horror"),
  Genre(mKey: "indie", mLabel: "Indie"),
  Genre(mKey: "music", mLabel: "Music"),
  Genre(mKey: "mystery", mLabel: "Mystery"),
  Genre(mKey: "road", mLabel: "Road"),
  Genre(mKey: "romance", mLabel: "Romance"),
  Genre(mKey: "science-fiction", mLabel: "Science Fiction"),
  Genre(mKey: "short", mLabel: "Short"),
  Genre(mKey: "sports", mLabel: "Sports"),
  Genre(mKey: "suspense", mLabel: "Suspense"),
  Genre(mKey: "thriller", mLabel: "Thriller"),
  Genre(mKey: "tv-movie", mLabel: "Tv Movie"),
  Genre(mKey: "war", mLabel: "War"),
  Genre(mKey: "western", mLabel: "Western")
];
