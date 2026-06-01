import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_data.freezed.dart';

part 'banner_data.g.dart';

@freezed
abstract class BannerData with _$BannerData {
  const factory BannerData({
    String? desc,
    int? id,
    String? imagePath,
    int? isVisible,
    int? order,
    String? title,
    int? type,
    String? url,
  }) = _BannerData;

  factory BannerData.fromJson(Map<String, dynamic> json) =>
      _$BannerDataFromJson(json);
}
