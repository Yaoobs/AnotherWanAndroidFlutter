import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tree_event.dart';
part 'tree_state.dart';

class TreeBloc extends Bloc<TreeEvent, TreeState> {
  TreeBloc() : super(TreeState()) {
    on<TreeEventSelectedIndexChanged>(
        (event, emit) => _mapSelectedIndexChangedToState(event, emit));
  }

  _mapSelectedIndexChangedToState(
    TreeEvent event,
    Emitter<TreeState> emit,
  ) {
    emit(state.copyWith(
        selectedIndex: (event as TreeEventSelectedIndexChanged).selectedIndex));
  }
}
