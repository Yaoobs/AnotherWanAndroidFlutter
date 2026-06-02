import 'package:freezed_annotation/freezed_annotation.dart';

part 'navi_state.freezed.dart';
part 'navi_state.g.dart';

@freezed
abstract class NaviState with _$NaviState {
  const factory NaviState({
    @Default([]) List naviDatas,
    String? errorMessage,
  }) = _NaviState;

  factory NaviState.fromJson(Map<String, Object?> json) =>
      _$NaviStateFromJson(json);
}
