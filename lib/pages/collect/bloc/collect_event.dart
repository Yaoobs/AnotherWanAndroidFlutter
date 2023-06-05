part of 'collect_bloc.dart';

abstract class CollectEvent extends Equatable {
  const CollectEvent();

  @override
  List<Object> get props => [];
}

class CollectEventLoadData extends CollectEvent {
  const CollectEventLoadData({required this.params});
  final Map params;
}
