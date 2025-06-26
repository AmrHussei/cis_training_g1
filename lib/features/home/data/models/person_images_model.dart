class PersonImagesModel {
  final int id;
  final List<ProfileImage> profiles;

  PersonImagesModel({
    required this.id,
    required this.profiles,
  });

  factory PersonImagesModel.fromJson(Map<String, dynamic> json) {
    return PersonImagesModel(
      id: json['id'],
      profiles: List<ProfileImage>.from(
        json['profiles'].map((x) => ProfileImage.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'profiles': profiles.map((x) => x.toJson()).toList(),
      };
}

class ProfileImage {
  final double aspectRatio;
  final int height;
  final String? iso6391;
  final String filePath;
  final double voteAverage;
  final int voteCount;
  final int width;

  ProfileImage({
    required this.aspectRatio,
    required this.height,
    this.iso6391,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) {
    return ProfileImage(
      aspectRatio: (json['aspect_ratio'] as num).toDouble(),
      height: json['height'],
      iso6391: json['iso_639_1'],
      filePath: json['file_path'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      width: json['width'],
    );
  }

  Map<String, dynamic> toJson() => {
        'aspect_ratio': aspectRatio,
        'height': height,
        'iso_639_1': iso6391,
        'file_path': filePath,
        'vote_average': voteAverage,
        'vote_count': voteCount,
        'width': width,
      };
}
