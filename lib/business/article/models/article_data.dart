import 'package:equatable/equatable.dart';

class ArticleData extends Equatable {
  final String apkLink;
  final int audit;
  final String author;
  final bool canEdit;
  final int chapterId;
  final String chapterName;
  final bool collect;
  final int courseId;
  final String desc;
  final String descMd;
  final String envelopePic;
  final bool fresh;
  final String host;
  final int id;
  final String link;
  final String niceDate;
  final String niceShareDate;
  final String origin;
  final String prefix;
  final String projectLink;
  final int publishTime;
  final int realSuperChapterId;
  final int selfVisible;
  final int shareDate;
  final String shareUser;
  final int superChapterId;
  final String superChapterName;
  final List<dynamic> tags;
  final String title;
  final int type;
  final int userId;
  final int visible;
  final int zan;

  const ArticleData({
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  factory ArticleData.fromJson(Map<String, dynamic> json) => ArticleData(
        apkLink: json['apkLink'] as String,
        audit: json['audit'] as int,
        author: json['author'] as String,
        canEdit: json['canEdit'] as bool,
        chapterId: json['chapterId'] as int,
        chapterName: json['chapterName'] as String,
        collect: json['collect'] as bool,
        courseId: json['courseId'] as int,
        desc: json['desc'] as String,
        descMd: json['descMd'] as String,
        envelopePic: json['envelopePic'] as String,
        fresh: json['fresh'] as bool,
        host: json['host'] as String,
        id: json['id'] as int,
        link: json['link'] as String,
        niceDate: json['niceDate'] as String,
        niceShareDate: json['niceShareDate'] as String,
        origin: json['origin'] as String,
        prefix: json['prefix'] as String,
        projectLink: json['projectLink'] as String,
        publishTime: json['publishTime'] as int,
        realSuperChapterId: json['realSuperChapterId'] as int,
        selfVisible: json['selfVisible'] as int,
        shareDate: json['shareDate'] as int,
        shareUser: json['shareUser'] as String,
        superChapterId: json['superChapterId'] as int,
        superChapterName: json['superChapterName'] as String,
        tags: json['tags'] as List<dynamic>,
        title: json['title'] as String,
        type: json['type'] as int,
        userId: json['userId'] as int,
        visible: json['visible'] as int,
        zan: json['zan'] as int,
      );

  Map<String, dynamic> toJson() => {
        'apkLink': apkLink,
        'audit': audit,
        'author': author,
        'canEdit': canEdit,
        'chapterId': chapterId,
        'chapterName': chapterName,
        'collect': collect,
        'courseId': courseId,
        'desc': desc,
        'descMd': descMd,
        'envelopePic': envelopePic,
        'fresh': fresh,
        'host': host,
        'id': id,
        'link': link,
        'niceDate': niceDate,
        'niceShareDate': niceShareDate,
        'origin': origin,
        'prefix': prefix,
        'projectLink': projectLink,
        'publishTime': publishTime,
        'realSuperChapterId': realSuperChapterId,
        'selfVisible': selfVisible,
        'shareDate': shareDate,
        'shareUser': shareUser,
        'superChapterId': superChapterId,
        'superChapterName': superChapterName,
        'tags': tags,
        'title': title,
        'type': type,
        'userId': userId,
        'visible': visible,
        'zan': zan,
      };

  ArticleData copyWith({
    String apkLink,
    int audit,
    String author,
    bool canEdit,
    int chapterId,
    String chapterName,
    bool collect,
    int courseId,
    String desc,
    String descMd,
    String envelopePic,
    bool fresh,
    String host,
    int id,
    String link,
    String niceDate,
    String niceShareDate,
    String origin,
    String prefix,
    String projectLink,
    int publishTime,
    int realSuperChapterId,
    int selfVisible,
    int shareDate,
    String shareUser,
    int superChapterId,
    String superChapterName,
    List<dynamic> tags,
    String title,
    int type,
    int userId,
    int visible,
    int zan,
  }) {
    return ArticleData(
      apkLink: apkLink ?? this.apkLink,
      audit: audit ?? this.audit,
      author: author ?? this.author,
      canEdit: canEdit ?? this.canEdit,
      chapterId: chapterId ?? this.chapterId,
      chapterName: chapterName ?? this.chapterName,
      collect: collect ?? this.collect,
      courseId: courseId ?? this.courseId,
      desc: desc ?? this.desc,
      descMd: descMd ?? this.descMd,
      envelopePic: envelopePic ?? this.envelopePic,
      fresh: fresh ?? this.fresh,
      host: host ?? this.host,
      id: id ?? this.id,
      link: link ?? this.link,
      niceDate: niceDate ?? this.niceDate,
      niceShareDate: niceShareDate ?? this.niceShareDate,
      origin: origin ?? this.origin,
      prefix: prefix ?? this.prefix,
      projectLink: projectLink ?? this.projectLink,
      publishTime: publishTime ?? this.publishTime,
      realSuperChapterId: realSuperChapterId ?? this.realSuperChapterId,
      selfVisible: selfVisible ?? this.selfVisible,
      shareDate: shareDate ?? this.shareDate,
      shareUser: shareUser ?? this.shareUser,
      superChapterId: superChapterId ?? this.superChapterId,
      superChapterName: superChapterName ?? this.superChapterName,
      tags: tags ?? this.tags,
      title: title ?? this.title,
      type: type ?? this.type,
      userId: userId ?? this.userId,
      visible: visible ?? this.visible,
      zan: zan ?? this.zan,
    );
  }

  @override
  List<Object> get props {
    return [
      apkLink,
      audit,
      author,
      canEdit,
      chapterId,
      chapterName,
      collect,
      courseId,
      desc,
      descMd,
      envelopePic,
      fresh,
      host,
      id,
      link,
      niceDate,
      niceShareDate,
      origin,
      prefix,
      projectLink,
      publishTime,
      realSuperChapterId,
      selfVisible,
      shareDate,
      shareUser,
      superChapterId,
      superChapterName,
      tags,
      title,
      type,
      userId,
      visible,
      zan,
    ];
  }
}
