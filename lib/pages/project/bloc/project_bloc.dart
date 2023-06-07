import 'package:anotherwanandroidflutter/api/project/project_api.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:anotherwanandroidflutter/models/tree_node_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectState()) {
    on<SelectedIndexChanged>(
        (event, emit) => _onSelectedIndexChanged(event, emit));
    on<GetTreeData>((event, emit) => _onGetTreeData(event, emit));
    on<GetListData>((event, emit) => _onGetListData(event, emit));
  }

  _onSelectedIndexChanged(
    ProjectEvent event,
    Emitter<ProjectState> emit,
  ) {
    emit(state.copyWith(
        selectedIndex: (event as SelectedIndexChanged).selectedIndex));
  }

  _onGetTreeData(
    ProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    // 获取 体系列表
    List<TreeNodeData> tabs = await ProjectApi.projectTree();
    emit(state.copyWith(
      tabs: tabs,
    ));
  }

  _onGetListData(
    ProjectEvent event,
    Emitter<ProjectState> emit,
  ) async {
    // 获取 体系下文章
    Map params = (event as GetListData).params;
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
