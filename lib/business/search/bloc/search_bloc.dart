import 'dart:async';

import 'package:anotherwanandroidflutter/business/search/models/hotkey_data.dart';
import 'package:anotherwanandroidflutter/network/search/net_search.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchState());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchEventLoadData) {
      yield* _mapLoadDataToState(event, state);
    }
  }

  Stream<SearchState> _mapLoadDataToState(
    SearchEvent event,
    SearchState state,
  ) async* {
    List list = await AWASearchNetManager.hotKeys();
    List<HotKeyData> hotKeys = List<Map>.from(list)
        .map((dynamic e) => HotKeyData.fromJson(e))
        .toList();
    yield state.copyWith(
      hotKeys: hotKeys,
    );
  }
}
