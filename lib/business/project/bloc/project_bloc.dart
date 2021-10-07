import 'dart:async';

import 'package:anotherwanandroidflutter/business/article/models/article_data.dart';
import 'package:anotherwanandroidflutter/business/tree/models/tree_node_data.dart';
import 'package:anotherwanandroidflutter/network/project/net_project.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectState());

  @override
  Stream<ProjectState> mapEventToState(
    ProjectEvent event,
  ) async* {
    if (event is ProjectEventSelectedIndexChanged) {
      yield _mapSelectedIndexChangedToState(event, state);
    } else if (event is ProjectEventLoadItems) {
      yield* _mapLoadItemsToState(event, state);
    } else if (event is ProjectEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  ProjectState _mapSelectedIndexChangedToState(
    ProjectEvent event,
    ProjectState state,
  ) {
    return state.copyWith(
        selectedIndex:
            (event as ProjectEventSelectedIndexChanged).selectedIndex);
  }

  Stream<ProjectState> _mapLoadItemsToState(
    ProjectEvent event,
    ProjectState state,
  ) async* {
    // 获取 体系列表
    List list = await AWAProjectNetManager.projectTree();
    List<TreeNodeData> tabs = List<Map>.from(list)
        .map((dynamic e) => TreeNodeData.fromJson(e))
        .toList();
    yield state.copyWith(
      tabs: tabs,
    );
  }

  Stream<ProjectState> _mapLoadDataToState(
    ProjectEvent event,
    ProjectState state,
  ) async* {
    // 获取 体系下文章
    Map params = (event as ProjectEventLoadData).params;
    Map articleList = await AWAProjectNetManager.projectList(
      page: params['page'],
      cid: params['cid'],
    );
    List<ArticleData> articles = List<Map>.from(articleList['datas'])
        .map((dynamic e) => ArticleData.fromJson(e))
        .toList();
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    yield state.copyWith(
      articles: articles,
    );
  }
}
