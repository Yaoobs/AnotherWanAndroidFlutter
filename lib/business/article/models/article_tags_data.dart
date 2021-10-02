import 'package:equatable/equatable.dart';

class ArticleTagsData extends Equatable {
  final String name;
  final String url;

  const ArticleTagsData({this.name, this.url});

  factory ArticleTagsData.fromJson(Map<String, dynamic> json) =>
      ArticleTagsData(
        name: json['name'] as String,
        url: json['url'] as String,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };

  ArticleTagsData copyWith({
    String name,
    String url,
  }) {
    return ArticleTagsData(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  List<Object> get props => [name, url];
}
