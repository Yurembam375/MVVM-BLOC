import 'package:freezed_annotation/freezed_annotation.dart';



@freezed
class MovieModel with _$MovieModel {
  factory MovieModel({
    @Default(0) @JsonKey(name: 'total') int total,
    @Default(0) int page,
    @Default([]) @JsonKey(name: 'tv_show') List<TvShow> tvShow,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

@freezed
class TvShow with _$TvShow {
  factory TvShow({
    @Default(0) int id,
    @Default('') String name,
    @Default('') String permalink,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @Default('') String country,
    @Default('') String network,
    @Default('') String status,
    @JsonKey(name: 'image_thumbnail_path') String? imageThumbnailPath,
  }) = _TvShow;

  factory TvShow.fromJson(Map<String, dynamic> json) =>
      _$TvShowFromJson(json);
}
