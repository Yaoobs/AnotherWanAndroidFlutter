part of 'collect_bloc.dart';

abstract class CollectEvent extends Equatable {
  const CollectEvent();

  @override
  List<Object> get props => [];
}

class GetCollectData extends CollectEvent {
  const GetCollectData({required this.params});
  final Map params;
}
