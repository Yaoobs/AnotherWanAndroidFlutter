import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tree_event.dart';
part 'tree_state.dart';

class TreeBloc extends Bloc<TreeEvent, TreeState> {
  TreeBloc() : super(TreeState()) {
    on<SelectedIndexChanged>(
        (event, emit) => _onSelectedIndexChanged(event, emit));
  }

  _onSelectedIndexChanged(
    TreeEvent event,
    Emitter<TreeState> emit,
  ) {
    emit(state.copyWith(
        selectedIndex: (event as SelectedIndexChanged).selectedIndex));
  }
}
