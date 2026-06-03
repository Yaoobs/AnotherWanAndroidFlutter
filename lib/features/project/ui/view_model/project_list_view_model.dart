import 'package:anotherwanandroidflutter/features/common/model/article_data.dart';
import 'package:anotherwanandroidflutter/features/common/model/article_list_data.dart';
import 'package:anotherwanandroidflutter/features/project/repository/project_repository.dart';
import 'package:anotherwanandroidflutter/features/project/ui/state/project_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_list_view_model.g.dart';

@Riverpod(keepAlive: false)
class ProjectListViewModel extends _$ProjectListViewModel {
  late ProjectRepository _repository;
  @override
  FutureOr<ProjectListState> build(int cid) async {
    _repository = await ref.watch(projectRepositoryProvider.future);
    ArticleListData articleDatas = await _repository.getProjectList(cid: cid);
    return ProjectListState(articles: articleDatas.datas ?? [], cid: cid);
  }

  Future<void> getProjectList({int? cid, bool loadMore = false}) async {
    try {
      int page = 1;
      List<ArticleData> articlesTotal = [];
      if (loadMore) {
        articlesTotal = [...state.value?.articles ?? []];
        page = state.value?.page ?? 1;
        page++;
      }
      ArticleListData articleDatas = await _repository.getProjectList(
        page: page,
        cid: cid ?? state.value?.cid ?? 0,
      );
      articlesTotal.addAll(articleDatas.datas ?? []);
      state = AsyncData(
        state.value!.copyWith(
          page: page,
          articles: articlesTotal,
          noMore: (articleDatas.curPage ?? 1) >= (articleDatas.pageCount ?? 1),
        ),
      );
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
