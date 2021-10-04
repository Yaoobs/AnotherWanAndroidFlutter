import 'package:equatable/equatable.dart';

class HotKeyData extends Equatable {
  final int id;
  final String link;
  final String name;
  final int order;
  final int visible;

  const HotKeyData({this.id, this.link, this.name, this.order, this.visible});

  factory HotKeyData.fromJson(Map<String, dynamic> json) => HotKeyData(
        id: json['id'] as int,
        link: json['link'] as String,
        name: json['name'] as String,
        order: json['order'] as int,
        visible: json['visible'] as int,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'link': link,
        'name': name,
        'order': order,
        'visible': visible,
      };

  HotKeyData copyWith({
    int id,
    String link,
    String name,
    int order,
    int visible,
  }) {
    return HotKeyData(
      id: id ?? this.id,
      link: link ?? this.link,
      name: name ?? this.name,
      order: order ?? this.order,
      visible: visible ?? this.visible,
    );
  }

  @override
  List<Object> get props => [id, link, name, order, visible];
}
