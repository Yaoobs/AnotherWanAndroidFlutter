part of 'wxarticle_bloc.dart';

abstract class WxArticleEvent extends Equatable {
  const WxArticleEvent();

  @override
  List<Object> get props => [];
}

class WxArticleEventSelectedIndexChanged extends WxArticleEvent {
  const WxArticleEventSelectedIndexChanged(this.selectedIndex);
  final int selectedIndex;
}

class WxArticleEventLoadItems extends WxArticleEvent {
  const WxArticleEventLoadItems();
}

class WxArticleEventLoadData extends WxArticleEvent {
  const WxArticleEventLoadData({this.params});
  final Map params;
}