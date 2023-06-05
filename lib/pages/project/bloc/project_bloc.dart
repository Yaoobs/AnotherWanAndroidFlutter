import 'package:anotherwanandroidflutter/api/project/project_api.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/tree_node_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectState()) {
    on<ProjectEventSelectedIndexChanged>(
        (event, emit) => _mapSelectedIndexChangedToState(event, emit));
    on<ProjectEventLoadItems>(
        (event, emit) => _mapLoadItemsToState(event, emit));
    on<ProjectEventLoadData>((event, emit) => _mapLoadDataToState(event, emit));
  }

  _mapSelectedIndexChangedToState(
    ProjectEvent event,
    Emitter<ProjectState> emit,
  ) {
    emit(state.copyWith(
        selectedIndex:
            (event as ProjectEventSelectedIndexChanged).selectedIndex));
  }

  _mapLoadItemsToState(
    ProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    // 获取 体系列表
    List<TreeNodeData> tabs = await ProjectApi.projectTree();
    emit(state.copyWith(
      tabs: tabs,
    ));
  }

  _mapLoadDataToState(
    ProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    // 获取 体系下文章
    Map params = (event as ProjectEventLoadData).params;
    List<ArticleData> articles = await ProjectApi.projectList(
      page: params['page'],
      cid: params['cid'],
    );
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    emit(state.copyWith(
      articles: articles,
    ));
  }
}
