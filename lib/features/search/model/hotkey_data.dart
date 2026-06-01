import 'package:freezed_annotation/freezed_annotation.dart';

part 'hotkey_data.freezed.dart';

part 'hotkey_data.g.dart';

@freezed
abstract class HotKeyData with _$HotKeyData {
  const factory HotKeyData({
     int? id,
    String? link,
    String? name,
    int? order,
    int? visible,
  }) = _HotKeyData;

  factory HotKeyData.fromJson(Map<String, dynamic> json) =>
      _$HotKeyDataFromJson(json);
}
