import 'package:anotherwanandroidflutter/api/collect/collect_api.dart';
import 'package:anotherwanandroidflutter/models/article_data.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'collect_event.dart';
part 'collect_state.dart';

class CollectBloc extends Bloc<CollectEvent, CollectState> {
  CollectBloc() : super(CollectState()) {
    on<CollectEventLoadData>((event, emit) => _mapLoadDataToState(event, emit));
  }

  _mapLoadDataToState(CollectEvent event, Emitter<CollectState> emit) async {
    // 获取 体系下文章
    Map params = (event as CollectEventLoadData).params;
    List<ArticleData> articles =
        await CollectApi.collectList(page: params['page']);
    if (params['page'] != null && params['page'] > 0) {
      articles.insertAll(0, state.articles);
    }
    emit(state.copyWith(
      articles: articles,
    ));
  }
}
