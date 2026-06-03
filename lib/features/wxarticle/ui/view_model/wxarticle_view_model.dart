import 'package:anotherwanandroidflutter/features/tree/model/tree_node_data.dart';
import 'package:anotherwanandroidflutter/features/wxarticle/repository/wxarticle_repository.dart';
import 'package:anotherwanandroidflutter/features/wxarticle/ui/state/wxarticle_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wxarticle_view_model.g.dart';

@Riverpod(keepAlive: false)
class WxArticleViewModel extends _$WxArticleViewModel {
  late WxArticleRepository _repository;
  @override
  FutureOr<WxArticleState> build() async {
    _repository = await ref.watch(wxArticleRepositoryProvider.future);
    List<TreeNodeData> articleChapters = await _repository.getWxArticleChapters();
    return WxArticleState(articleChapters: articleChapters);
  }

  Future<void> getWxArticleChapters() async {
    try {
      List<TreeNodeData> articleChapters = await _repository.getWxArticleChapters();
      state = AsyncData(state.value!.copyWith(articleChapters: articleChapters));
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
