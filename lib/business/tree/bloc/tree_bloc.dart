import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tree_event.dart';
part 'tree_state.dart';

class TreeBloc extends Bloc<TreeEvent, TreeState> {
  TreeBloc() : super(TreeState());

  @override
  Stream<TreeState> mapEventToState(
    TreeEvent event,
  ) async* {
    if (event is TreeEventSelectedIndexChanged) {
      yield _mapSelectedIndexChangedToState(event, state);
    }
  }

  TreeState _mapSelectedIndexChangedToState(
    TreeEvent event,
    TreeState state,
  ) {
    return state.copyWith(
        selectedIndex: (event as TreeEventSelectedIndexChanged).selectedIndex);
  }
}
