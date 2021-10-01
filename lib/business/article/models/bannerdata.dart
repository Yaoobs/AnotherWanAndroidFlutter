import 'package:equatable/equatable.dart';

class BannerData extends Equatable {
  final String desc;
  final int id;
  final String imagePath;
  final int isVisible;
  final int order;
  final String title;
  final int type;
  final String url;

  const BannerData({
    this.desc,
    this.id,
    this.imagePath,
    this.isVisible,
    this.order,
    this.title,
    this.type,
    this.url,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) => BannerData(
        desc: json['desc'] as String,
        id: json['id'] as int,
        imagePath: json['imagePath'] as String,
        isVisible: json['isVisible'] as int,
        order: json['order'] as int,
        title: json['title'] as String,
        type: json['type'] as int,
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => {
        'desc': desc,
        'id': id,
        'imagePath': imagePath,
        'isVisible': isVisible,
        'order': order,
        'title': title,
        'type': type,
        'url': url,
      };

  BannerData copyWith({
    String desc,
    int id,
    String imagePath,
    int isVisible,
    int order,
    String title,
    int type,
    String url,
  }) {
    return BannerData(
      desc: desc ?? this.desc,
      id: id ?? this.id,
      imagePath: imagePath ?? this.imagePath,
      isVisible: isVisible ?? this.isVisible,
      order: order ?? this.order,
      title: title ?? this.title,
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props {
    return [
      desc,
      id,
      imagePath,
      isVisible,
      order,
      title,
      type,
      url,
    ];
  }
}
