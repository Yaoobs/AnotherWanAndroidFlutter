import 'package:anotherwanandroidflutter/features/navi/repository/navi_repository.dart';
import 'package:anotherwanandroidflutter/features/navi/ui/state/navi_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navi_view_model.g.dart';

@Riverpod(keepAlive: true)
class NaviViewModel extends _$NaviViewModel {
  late NaviRepository _repository;
  @override
  FutureOr<NaviState> build() async {
    _repository = await ref.watch(naviRepositoryProvider.future);
    List naviDatas = await _repository.getNaviList();
    return NaviState(naviDatas: naviDatas);
  }
}
