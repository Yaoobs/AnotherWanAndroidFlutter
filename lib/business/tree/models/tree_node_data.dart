import 'package:equatable/equatable.dart';

class TreeNodeData extends Equatable {
  final List<dynamic> children;
  final int courseId;
  final int id;
  final String name;
  final int order;
  final int parentChapterId;
  final bool userControlSetTop;
  final int visible;

  const TreeNodeData({
    this.children,
    this.courseId,
    this.id,
    this.name,
    this.order,
    this.parentChapterId,
    this.userControlSetTop,
    this.visible,
  });

  factory TreeNodeData.fromJson(Map<String, dynamic> json) => TreeNodeData(
        children: json['children'] as List<dynamic>,
        courseId: json['courseId'] as int,
        id: json['id'] as int,
        name: json['name'] as String,
        order: json['order'] as int,
        parentChapterId: json['parentChapterId'] as int,
        userControlSetTop: json['userControlSetTop'] as bool,
        visible: json['visible'] as int,
      );

  Map<String, dynamic> toJson() => {
        'children': children,
        'courseId': courseId,
        'id': id,
        'name': name,
        'order': order,
        'parentChapterId': parentChapterId,
        'userControlSetTop': userControlSetTop,
        'visible': visible,
      };

  TreeNodeData copyWith({
    List<dynamic> children,
    int courseId,
    int id,
    String name,
    int order,
    int parentChapterId,
    bool userControlSetTop,
    int visible,
  }) {
    return TreeNodeData(
      children: children ?? this.children,
      courseId: courseId ?? this.courseId,
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      parentChapterId: parentChapterId ?? this.parentChapterId,
      userControlSetTop: userControlSetTop ?? this.userControlSetTop,
      visible: visible ?? this.visible,
    );
  }

  @override
  List<Object> get props {
    return [
      children,
      courseId,
      id,
      name,
      order,
      parentChapterId,
      userControlSetTop,
      visible,
    ];
  }
}
