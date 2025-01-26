import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    @JsonKey(name: 'total') @Default(0) int total,
    @Default(0) int page,
    @Default(0) int pages,
    @JsonKey(name: 'tv_shows') @Default([]) List<TvShow> tvShow,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

@freezed
class TvShow with _$TvShow {
  factory TvShow({
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'permalink') @Default('') String permalink,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'country') @Default('') String country,
    @JsonKey(name: 'network') @Default('') String network,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'image_thumbnail_path') String? imageThumbnailPath,
  }) = _TvShow;

  factory TvShow.fromJson(Map<String, dynamic> json) =>
      _$TvShowFromJson(json);
}
