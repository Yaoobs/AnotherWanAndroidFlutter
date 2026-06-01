import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree_node_data.freezed.dart';
part 'tree_node_data.g.dart';

@freezed
abstract class TreeNodeData with _$TreeNodeData {
  const factory TreeNodeData({
    List<dynamic>? children,
    int? courseId,
    int? id,
    String? name,
    int? order,
    int? parentChapterId,
    bool? userControlSetTop,
    int? visible,
  }) = _TreeNodeData;

  factory TreeNodeData.fromJson(Map<String, dynamic> json) =>
      _$TreeNodeDataFromJson(json);
}
