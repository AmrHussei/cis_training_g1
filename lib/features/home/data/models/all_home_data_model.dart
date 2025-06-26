class AllHomeDataModel {
  final int page;
  final List<Person> results;

  AllHomeDataModel({
    required this.page,
    required this.results,
  });

  factory AllHomeDataModel.fromJson(Map<String, dynamic> json) {
    return AllHomeDataModel(
      page: json['page'],
      results:
          List<Person>.from(json['results'].map((x) => Person.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results.map((x) => x.toJson()).toList(),
      };
}

class Person {
  final bool? adult;
  final int gender;
  final int id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double popularity;
  final String? profilePath;
  final List<KnownFor> knownFor;

  Person({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    this.profilePath,
    required this.knownFor,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'],
      knownFor: List<KnownFor>.from(
          json['known_for'].map((x) => KnownFor.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'gender': gender,
        'id': id,
        'known_for_department': knownForDepartment,
        'name': name,
        'original_name': originalName,
        'popularity': popularity,
        'profile_path': profilePath,
        'known_for': knownFor.map((x) => x.toJson()).toList(),
      };
}

class KnownFor {
  final bool? adult;
  final String? backdropPath;
  final int id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final String? originalLanguage;
  final List<int> genreIds;
  final double popularity;
  final String? releaseDate;
  final bool? video;
  final double voteAverage;
  final int voteCount;

  KnownFor({
    required this.adult,
    this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.mediaType,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory KnownFor.fromJson(Map<String, dynamic> json) {
    return KnownFor(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      title: json['title'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      mediaType: json['media_type'],
      originalLanguage: json['original_language'],
      genreIds: List<int>.from(json['genre_ids']),
      popularity: (json['popularity'] as num).toDouble(),
      releaseDate: json['release_date'],
      video: json['video'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'id': id,
        'title': title,
        'original_title': originalTitle,
        'overview': overview,
        'poster_path': posterPath,
        'media_type': mediaType,
        'original_language': originalLanguage,
        'genre_ids': genreIds,
        'popularity': popularity,
        'release_date': releaseDate,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };
}
