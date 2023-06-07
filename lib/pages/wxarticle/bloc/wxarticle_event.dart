part of 'wxarticle_bloc.dart';

abstract class WxArticleEvent extends Equatable {
  const WxArticleEvent();

  @override
  List<Object> get props => [];
}

class SelectedIndexChanged extends WxArticleEvent {
  const SelectedIndexChanged(this.selectedIndex);
  final int selectedIndex;
}

class GetArticleChapters extends WxArticleEvent {
  const GetArticleChapters();
}

class GetArticleList extends WxArticleEvent {
  const GetArticleList({required this.params});
  final Map params;
}
